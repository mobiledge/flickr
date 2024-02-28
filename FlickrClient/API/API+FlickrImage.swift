//
//  API+FlickrImage.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-27.
//

import Foundation

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
