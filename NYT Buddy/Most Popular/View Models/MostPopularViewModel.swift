//
//  MostPopularViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

class MostPopularViewModel: ObservableObject {
    var mostPopularDataService: MostPopularDataService?

    @Published var articles = [MostPopularArticle]()

    init() {
        mostPopularDataService = MostPopularDataService()
    }

    func fetchMostPopularArticles(for period: Period) {
        mostPopularDataService?.fetchMostViewedArticles { result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles
                }
            case .failure(let error):
                print("Failed to fetch currency data: \(error.localizedDescription)")
            }
        }
    }
}
