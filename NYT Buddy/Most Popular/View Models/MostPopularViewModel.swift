//
//  MostPopularViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

class MostPopularViewModel: ObservableObject {
    // MARK: - Properties
    var mostPopularDataService: MostPopularDataService?

    @Published var articles = [ViewedArticle]()
    @Published var selectedPeriod = Period.daily.rawValue {
        didSet {
            mostPopularDataService?.updatePeriod(selectedPeriod)
        }
    }
    @Published private(set) var state = LoadingState.idle
    @Published var selectedArticleType: MostPopularArticleType = .viewed {
        didSet {
            fetchMostPopularArticles()
        }
    }

    // MARK: - Init
    init() {
        mostPopularDataService = MostPopularDataService(period: selectedPeriod)
    }

    // MARK: - Custom methods
    func fetchMostPopularArticles() {
        state = .loading

        mostPopularDataService?.fetchMostPopularArticles(for: selectedArticleType) { result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                    self.state = .success
                }
            case .failure(let error):
                print("Failed to fetch currency data: \(error.localizedDescription)")
                self.state = .failed(error)
            }
        }
    }
}
