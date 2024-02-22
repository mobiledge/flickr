//
//  DetailView.swift
//  FlickrClient
//
//  Created by Rabin Joshi on 2024-02-19.
//

import SwiftUI
//import RichText

struct DetailView: View {
    let item: FlickrImage

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20.0) {

                AsyncImage(url: item.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .accessibility(label: Text("Image of \(item.description)"))
                } placeholder: {
                    ProgressView()
                }

                Text(item.title)
                    .font(.title)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)

                VStack(alignment: .leading) {
                    Label("Author", systemImage: "person.circle")
                        .font(.headline)
                    Text(item.author)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Label("Published", systemImage: "calendar.circle")
                        .font(.headline)
                    Text(item.published.formatted())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Label("Description", systemImage: "calendar.circle")
                        .font(.headline)
//                    RichText(html: item.description)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(item: FlickrImage.previewImage())
}
