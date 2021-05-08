//
//  BooksScrollView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 07/05/2021.
//

import SwiftUI

struct BooksScrollView: View {
    var books: [BooksOverviewResults.Book]
    var body: some View {

        ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(spacing: 20.0) {
                ForEach(books, id: \.self) { book in
                    NavigationLink(
                        destination: BookDetailsView(book: book),
                        label: {
                            RemoteImage(url: book.bookImage, size: CGSize(width: 150, height: 150), aspectRatio: .fit)
                        })
                }
            }
        })
    }
}

struct BooksScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BooksScrollView(books: Array(repeating: BooksOverviewResults.Book.exampleData, count: 5))
            .previewLayout(.sizeThatFits)
    }
}
