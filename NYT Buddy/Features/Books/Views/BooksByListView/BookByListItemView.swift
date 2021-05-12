//
//  BookByListItemView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 12/05/2021.
//

import SwiftUI

struct BookByListItemView: View {
    // MARK: - Properties
    var book: BooksByListResults.Book

    // MARK: - Body
    var body: some View {
        HStack {
            RemoteImage(url: book.bookImage.absoluteString, size: CGSize(width: 150, height: 150), aspectRatio: .fit)

            VStack(alignment: .leading, spacing: 5) {
                Text("#\(book.rank)")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("AccentColor"))

                Text(book.title)

                Group {
                    Text(book.contributor)
                    Text("Published by \(book.publisher)")
                }
                .foregroundColor(.secondary)
                .font(.caption)
            }
        }
        .frame(maxHeight: 150)
    }
}

// MARK: - Preview
struct BookByListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookByListItemView(book: BooksByListResults.Book.exampleData)
            .previewLayout(.sizeThatFits)
    }
}
