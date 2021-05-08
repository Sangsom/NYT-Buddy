//
//  BookDetailsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 07/05/2021.
//

import SwiftUI

struct BookDetailsView: View {
    // MARK: - Properties
    var book: BooksOverviewResults.Book

    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 10.0, content: {
                if let imageUrl = book.bookImage {
                        RemoteImage(
                            url: imageUrl,
                            size: CGSize(width: geo.size.width, height: geo.size.height / 3),
                            aspectRatio: .fit)
                    }
                Text(book.title)

                Spacer()
            })
        }
    }
}

// MARK: - Preview
struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: BooksOverviewResults.Book.exampleData)
    }
}
