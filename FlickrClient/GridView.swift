//
//  GridView.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var dataModel: DataModel
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(dataModel.items) { item in
                    GeometryReader { geo in
                        NavigationLink(destination: DetailView(item: item)) {
                            GridItemView(size: geo.size.width, item: item)
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding()
        }
        .onAppear()
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            // This code dynamically adjusts the grid view's number of columns based on changes in device orientation.
            // It listens for UIDevice.orientationDidChangeNotification and updates 'gridColumns' to
            // have either 3 or 2 columns depending on whether the device is in landscape or portrait mode.
            let isLandscape = UIDevice.current.orientation.isLandscape
            let count = isLandscape ? 3 : 2
            gridColumns = Array(repeating: GridItem(.flexible()), count: count)
        }
    }
}

#Preview {
    GridView().environmentObject(DataModel())
}
