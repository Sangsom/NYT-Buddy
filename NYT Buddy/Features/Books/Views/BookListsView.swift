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
        Text("Hello, World!")
    }
}

struct BookListsView_Previews: PreviewProvider {
    static var previews: some View {
        BookListsView(lists: Array(repeating: BooksOverviewResults.List.exampleData, count: 5))
    }
}
