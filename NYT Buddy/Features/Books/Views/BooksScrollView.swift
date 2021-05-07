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
            HStack {
                ForEach(books, id: \.self) { book in
                    VStack(alignment: .leading, spacing: 8) {
                        if let imageURL = book.bookImage {
                            RemoteImage(url: imageURL, size: CGSize(width: 150, height: 150))
                        }
                    }
                }
            }
            .frame(width: 150, height: 150)
        })
    }
}

struct BooksScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BooksScrollView(books: Array(repeating: BooksOverviewResults.Book.exampleData, count: 5))
            .previewLayout(.sizeThatFits)
    }
}
