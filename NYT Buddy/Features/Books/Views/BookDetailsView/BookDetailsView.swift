//
//  BookDetailsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 07/05/2021.
//

import SwiftUI

struct BookDetailsView: View {
    var book: BooksOverviewResults.Book

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: BooksOverviewResults.Book.exampleData)
    }
}
