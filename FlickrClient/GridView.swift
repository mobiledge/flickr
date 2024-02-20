//
//  GridView.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var dataModel: DataModel
    private var gridColumns = Array(repeating: GridItem(.flexible()), count: 2)

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
    }
}

#Preview {
    GridView().environmentObject(DataModel())
}
