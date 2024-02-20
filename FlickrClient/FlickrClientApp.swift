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
            .onChange(of: searchText) { _, newValue in
                dataModel.search(tag: newValue)
            }
        }
    }
}
