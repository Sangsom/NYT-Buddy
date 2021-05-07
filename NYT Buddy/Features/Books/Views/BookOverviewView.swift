//
//  BookOverviewView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import SwiftUI

struct BookOverviewView: View {
    // MARK: - Properties
    @EnvironmentObject var booksViewModel: BooksViewModel

    // MARK: - Body
    var body: some View {
        ZStack {
            List(booksViewModel.booksList) { item in
                Text(item.name)
            }
            .blur(radius: booksViewModel.state == .loading ? 4 : 0)

            if booksViewModel.state == .loading {
                LoadingView()
            }
        }
        .onAppear(perform: loadData)
        .navigationTitle("Best Sellers List")
    }

    // MARK: - Custom methods
    func loadData() {
        booksViewModel.fetchBooksListNames()
    }
}

struct BookListsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookOverviewView()
                .environmentObject(BooksViewModel())
        }
    }
}
