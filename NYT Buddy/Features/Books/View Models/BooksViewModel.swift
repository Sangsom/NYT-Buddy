//
//  BooksViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import SwiftUI

class BooksViewModel: ObservableObject {
    // MARK: - Properties
    var booksDataService: BooksDataService?

    @Published var booksList = [BooksOverviewResults.List]()
    @Published var booksByList = [BooksByListResults.Book]()

    @Published private(set) var state = LoadingState.idle

    // MARK: - Init
    init() {
        booksDataService = BooksDataService()
    }

    // MARK: - Custom methods
    func fetchBooksListNames() {
        state = .loading

        booksDataService?.fetchOverview(completion: { result in
            switch result {
            case .success(let bookListNames):
                DispatchQueue.main.async {
                    self.booksList = bookListNames
                    self.state = .success
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Failed to fetch books data: \(error.localizedDescription)")
                    self.state = .failed(error)
                }
            }
        })
    }

    func fetchBooksByList(_ listName: String) {
        state = .loading

        booksDataService?.fetchBooksByList(listName, completion: { result in
            switch result {
            case .success(let bookListNames):
                DispatchQueue.main.async {
                    self.booksByList = bookListNames
                    self.state = .success
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Failed to fetch books by list data: \(error.localizedDescription)")
                    self.state = .failed(error)
                }
            }
        })
    }
}
