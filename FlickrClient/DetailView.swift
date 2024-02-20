//
//  DetailView.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI
import RichText

struct DetailView: View {
    let item: FlickrImage

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: item.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }

                Text(item.title)
                    .font(.title)
                    .foregroundStyle(.primary)

                Text(item.author)
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                Text(item.date_taken)
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                RichText(html: item.description)
                    .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    DetailView(item: FlickrImage.previewImage())
}
