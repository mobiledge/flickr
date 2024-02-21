//
//  FlickrAPI.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation

class FlickrAPI {
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    // Replaced with mock client in tests
    let networkClient: NetworkClient

    func fetchImages(tag: String) async throws -> [FlickrImage] {
        // Ignore empty string
        if tag.isEmpty {
            return []
        }

        // Construct URL
        guard let url = createURL(withTag: tag) else {
            throw "Unable to create URL!"
        }

        // Perform network request
        let data = try await networkClient.data(from: url)

        // Parse JSON response
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(APIResponse.self, from: data)
        return response.items
    }

    func createURL(withTag tag: String) -> URL? {
        let urlString =  "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
        return URL(string: urlString + tag)
    }
}

class NetworkClient {
    let session = URLSession.shared

    func data(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

extension String: Error {}
