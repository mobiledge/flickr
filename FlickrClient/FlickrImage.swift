//
//  FlickrImage.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation

struct FlickrImage: Codable, Identifiable {
    let title: String
    let link: String
    let media: [String: String]
    let date_taken: String
    let description: String
    let published: String
    let author: String
    let author_id: String
    let tags: String

    var id: String {
        return link
    }
    var url: URL? {
        guard let first = media.values.first else {
            return nil
        }
        return URL(string: first)
    }

    static func previewImage() -> FlickrImage {
        guard let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let response = try? JSONDecoder().decode(APIResponse.self, from: data),
              let first = response.items.first else {
            fatalError()
        }
        return first
    }
}
