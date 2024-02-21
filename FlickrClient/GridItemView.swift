//
//  GridItemView.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI

struct GridItemView: View {
    let size: Double
    let item: FlickrImage

    var body: some View {
        AsyncImage(url: item.url) { image in
            image.resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: size, height: size)
                .accessibility(label: Text("Image of \(item.description)"))
        } placeholder: {
            ProgressView()
        }
    }

}

#Preview {
    GridItemView(size: 200, item: FlickrImage.previewImage())
}
