//
//  BookListsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 07/05/2021.
//

import SwiftUI

struct BookListsView: View {
    var lists: [BooksOverviewResults.List]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(lists) { item in
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text(item.name)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)

                        BooksScrollView(books: item.books)

                        HStack {
                            Spacer()
                            NavigationLink(
                                destination: BooksByListView(booksList: item),
                                label: {
                                    Text("Show all")
                                })
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct BookListsView_Previews: PreviewProvider {
    static var previews: some View {
        BookListsView(lists: Array(repeating: BooksOverviewResults.List.exampleData, count: 5))
    }
}
