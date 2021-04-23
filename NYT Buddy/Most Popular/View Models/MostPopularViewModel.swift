//
//  MostPopularViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

class MostPopularViewModel: ObservableObject {
    @Published var articles = [MostPopularArticle]()

    func fetchMostPopularArticles() {
        MostPopularDataService.shared.fetchMostViewedArticles { result in
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
