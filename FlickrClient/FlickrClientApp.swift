//
//  FlickrClientApp.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI

@main
struct FlickrClientApp: App {
    @StateObject var dataModel = DataModel()
    @State private var searchText = ""

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GridView()
                    .navigationTitle("Flickr Client")
            }
            .environmentObject(dataModel)
            .navigationViewStyle(.stack)
            .searchable(text: $searchText, prompt: "Search")
            .overlay {
                overlayView
            }
            .onChange(of: searchText) { _, newValue in
                dataModel.search(tag: newValue)
            }
        }
    }

    @ViewBuilder
    var overlayView: some View {
        switch dataModel.loadingState {
        case .initial:
            ContentUnavailableView {
                Label("Discover photos on Flickr", systemImage: "magnifyingglass")
            } description: {
                Text("Looking for something specific? Enter keywords to browse Flickr's photo gallery.")
            }

        case .loading:
            ContentUnavailableView {
                ProgressView()
            } description: {
                Text("Loading...")
            }

        case .empty:
            ContentUnavailableView.search

        case .error(let localizedDescription):
            ContentUnavailableView {
                Label("Error!", systemImage: "exclamationmark.triangle")
            } description: {
                Text(localizedDescription)
            }

        default:
            EmptyView()
        }
    }
}
