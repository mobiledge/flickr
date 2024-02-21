//
//  DataModel.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import Foundation

enum LoadingState {
    case initial
    case loading
    case loaded(items: [FlickrImage])
    case empty
    case error(localizedDescription: String)
}

@MainActor
class DataModel: ObservableObject {
    @Published var loadingState = LoadingState.initial
    var items: [FlickrImage] {
        if case .loaded(items: let arr) = loadingState {
            return arr
        }
        return []
    }

    private let api = FlickrAPI(networkClient: NetworkClient())

    func search(tag: String) {

        if tag.isEmpty {
            loadingState = .initial
            return
        }

        Task {
            do {
                loadingState = .loading
                let arr = try await api.fetchImages(tag: tag)
                if arr.isEmpty {
                    loadingState = .empty
                } else {
                    loadingState = .loaded(items: arr)
                }
            } catch {
                let localizedDescription = "Failed to load images. Please try again later."
                loadingState = .error(localizedDescription: localizedDescription)
            }
        }
    }
}

