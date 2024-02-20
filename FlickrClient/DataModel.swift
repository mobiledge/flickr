//
//  DataModel.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation

@MainActor
class DataModel: ObservableObject {
    @Published var items: [FlickrImage] = []
    private let api = FlickrAPI(networkClient: NetworkClient())

    func search(tag: String) {
        Task {
            do {
                let arr = try await api.fetchImages(tag: tag)
                self.items = arr
            } catch {
                self.items = []
            }
        }
    }
}

