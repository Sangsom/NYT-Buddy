//
//  BooksByListView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 10/05/2021.
//

import SwiftUI

struct BooksByListView: View {
    let booksList: BooksOverviewResults.List

    var body: some View {
        Text(booksList.name)
    }
}

struct BooksByListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksByListView(booksList: BooksOverviewResults.List.exampleData)
    }
}
