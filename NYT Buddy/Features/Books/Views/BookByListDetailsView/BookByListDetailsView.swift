//
//  BookByListDetailsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 12/05/2021.
//

import SwiftUI
import MobileCoreServices

struct BookByListDetailsView: View {
    // MARK: - Properties
    @Environment(\.openURL) var openURL

    var book: BooksByListResults.Book

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10.0, content: {
                if let imageUrl = book.bookImage {
                    HStack {
                        Spacer()
                        RemoteImage(
                            url: imageUrl.absoluteString,
                            size: nil,
                            aspectRatio: .fit)
                            .frame(maxHeight: 300)
                        Spacer()
                    }
                    .padding(.top)
                }

                Text(book.title)
                    .font(.title)
                    .fontWeight(.medium)

                Text(book.description)
                    .font(.body)

                HStack(alignment: .center) {
                    Text("#\(book.rank)")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color("AccentColor"))

                    Spacer()
                    Text("by \(book.author)")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("ISBN: \(book.isbn13)")
                    Spacer()
                    Button(action: {
                        UIPasteboard.general.setValue(book.isbn13, forPasteboardType: kUTTypePlainText as String)
                    }, label: {
                        Image(systemName: "doc.on.doc.fill")
                            .foregroundColor(.primary)
                    })
                }

                Divider()

                if book.buyLinks.count > 0,
                   let links = book.buyLinks {
                    Text("Shop links".uppercased())
                        .font(.headline)

                    ForEach(links, id: \.self) { link in
                        Button("\(link.name)") {
                            openFullStory(link: link)
                        }
                    }
                }

                Spacer()
            })
            .navigationBarTitle("", displayMode: .inline)
            .padding(.horizontal)
        }
    }

    // MARK: - Custom methods
    func openFullStory(link: BuyLink) {
        openURL(link.url)
    }
}
struct BookByListDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookByListDetailsView(book: BooksByListResults.Book.exampleData)
    }
}
