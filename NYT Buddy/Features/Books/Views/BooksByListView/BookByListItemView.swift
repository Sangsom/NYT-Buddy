//
//  BookByListItemView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 12/05/2021.
//

import SwiftUI

struct BookByListItemView: View {
    var book: BooksByListResults.Book

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BookByListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookByListItemView(book: BooksByListResults.Book.exampleData)
    }
}
