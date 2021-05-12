//
//  BooksByListView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 10/05/2021.
//

import SwiftUI

struct BooksByListView: View {
    // MARK: - Properties
    @EnvironmentObject var booksViewModel: BooksViewModel

    let listName: String

    // MARK: - Body
    var body: some View {
        Text(listName)
            .onAppear(perform: loadData)
    }

    // MARK: - Custom methods
    func loadData() {
        booksViewModel.fetchBooksByList(listName)
    }
}

struct BooksByListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksByListView(listName: "combined-print-and-e-book-fiction")
            .environmentObject(BooksViewModel())
    }
}
