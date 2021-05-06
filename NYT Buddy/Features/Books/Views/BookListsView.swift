//
//  BookListsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import SwiftUI

struct BookListsView: View {
    // MARK: - Properties
    @EnvironmentObject var booksViewModel: BooksViewModel

    // MARK: - Body
    var body: some View {
        Text("Hello, World!")
            .onAppear(perform: loadData)
    }

    // MARK: - Custom methods
    func loadData() {
        booksViewModel.fetchBooksListNames()
    }
}

struct BookListsView_Previews: PreviewProvider {
    static var previews: some View {
        BookListsView()
            .environmentObject(BooksViewModel())
    }
}
