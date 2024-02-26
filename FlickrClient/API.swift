//
//  FlickrAPI.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation
import Combine

class API {
    // Constants
    let baseURL: String = "https://api.flickr.com"
    let defaultQueryItems = [URLQueryItem(name: "format", value: "json"), URLQueryItem(name: "nojsoncallback", value: "1")]
    let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    static var current = API(session: .current)
    let session: Session
    internal init(session: API.Session) {
        self.session = session
    }

    func newRequest() -> APIRequest {
        APIRequest(baseURL: baseURL)
            .set(queryParams: defaultQueryItems)
    }
}

extension API {
    struct Session {
        static var current = Session { req in
            try await URLSession.shared.data(for: req)
        }
        var dispatcher: (URLRequest) async throws -> (Data, URLResponse)
    }
    class APIRequest {
        internal init(baseURL: String) {
            self.baseURL = baseURL
        }
        var baseURL: String
        var path: String?
        var queryParams: [URLQueryItem]?
        var headerParams: [String: String]?
        var httpMethod: String?
        var httpBody: Data?
        var urlRequest: URLRequest?
        var session: Session?

        @discardableResult func set(path: String) -> APIRequest {
            self.path = path
            return self
        }
        @discardableResult func set(queryParams: [URLQueryItem]?) -> APIRequest {
            self.queryParams = queryParams
            return self
        }
        @discardableResult func add(queryItem: URLQueryItem) -> APIRequest {
            var params = queryParams ?? []
            params.append(queryItem)
            self.queryParams = params
            return self
        }
        @discardableResult func set(headerParams: [String: String]?) -> APIRequest {
            self.headerParams = headerParams
            return self
        }
        @discardableResult func set(httpMethod: String) -> APIRequest {
            self.httpMethod = httpMethod
            return self
        }
        @discardableResult func set(httpBody: Data?) -> APIRequest {
            self.httpBody = httpBody
            return self
        }
        @discardableResult func set(session: Session) -> APIRequest {
            self.session = session
            return self
        }

        func build() throws -> APIRequest {
            guard let path = path else {
                throw APIError.missingPath
            }

            guard let httpMethod = httpMethod else {
                throw APIError.missingHTTPMethod
            }

            // Construct URL
            guard var components = URLComponents(string: baseURL) else {
                throw APIError.invalidURLComponents
            }
            components.path = path
            components.queryItems = queryParams
            guard let url = components.url else {
                throw APIError.invalidURL
            }

            // Construct Request
            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            urlRequest.httpBody = httpBody
            urlRequest.allHTTPHeaderFields = headerParams

            self.urlRequest = urlRequest
            return self
        }

        func send(session: Session) async throws -> Response {
            guard let urlRequest = urlRequest else {
                throw APIError.missingURLRequest
            }
            log(urlRequest.url?.absoluteString)
            do {
                let (data, res) = try await session.dispatcher(urlRequest)
                let response = Response(data: data, urlResponse: res)
                return response
            } catch {
                // Handle other errors that might occur during the network request
                throw APIError.networkError(error)
            }
        }

        // Response
        struct Response {
            let data: Data
            let urlResponse: URLResponse

            // Response Decoding
            @discardableResult func decoded<T: Decodable>(as type: T.Type, decoder: JSONDecoder = JSONDecoder()) async throws -> T {
                do {
                    return try decoder.decode(T.self, from: data)
                } catch {
                    // Encapsulate decoding errors in the new error case
                    //log(String(data: data, encoding: .utf8))
                    throw APIError.decodingFailed(error)
                }
            }
        }
    }
}

enum APIError: Error {
    case missingBaseURL
    case missingPath
    case missingHTTPMethod
    case invalidURLComponents
    case invalidURL
    case missingURLRequest
    case missingSession
    case networkError(Error)
    case decodingFailed(Error)
}

extension API {
    func searchImages(tag: String) async throws -> [FlickrImage] {
        try await newRequest()
            .set(path: "/services/feeds/photos_public.gne")
            .add(queryItem: URLQueryItem(name: "tags", value: tag))
            .set(httpMethod: "GET")
            .build()
            .send(session: session)
            .decoded(as: APIResponse.self, decoder: defaultDecoder)
            .items
    }
}
