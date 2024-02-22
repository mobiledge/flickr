//
//  FlickrAPI.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation

class FlickrAPI {
    private static let baseURL = "https://www.flickr.com"
    private static let defaultQueryItems = [URLQueryItem(name: "format", value: "json"), URLQueryItem(name: "nojsoncallback", value: "1")]

    func constructURL(path: String, queryItems: [URLQueryItem]? = nil) throws -> URL {
        guard var components = URLComponents(string: Self.baseURL) else {
            throw error("Failed to construct URL!")
        }
        components.path = path
        components.queryItems = Self.defaultQueryItems + (queryItems ?? [])
        guard let url = components.url else {
            throw error("Failed to construct URL!")
        }
        return url
    }

    func constructRequest(url: URL, httpMethod: String, httpBody: Data?) throws -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.httpBody = httpBody
        return urlRequest
    }

    func get(path: String, queryItems: [URLQueryItem]? = nil) async throws -> Data {
        let url = try constructURL(path: path, queryItems: queryItems)
        let req = try constructRequest(url: url, httpMethod: "GET", httpBody: nil)
        let data = try await dispatch(request: req)
        return data
    }

    func dispatch(request: URLRequest) async throws -> Data {
        log(request.url?.absoluteString)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

extension FlickrAPI {
    func searchImages(tag: String) async throws -> [FlickrImage] {
        let path = "/services/feeds/photos_public.gne"
        let queryItems = [URLQueryItem(name: "tags", value: tag)]
        let data = try await get(path: path, queryItems: queryItems)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(APIResponse.self, from: data)
        return response.items
    }
}
