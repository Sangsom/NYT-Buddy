//
//  TopStoriesViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

class TopStoriesViewModel: ObservableObject {
    // MARK: - Properties
    var topStoriesDataService: TopStoriesDataService?

    @Published var stories = [MostPopularArticle]()

    // MARK: - Init
    init() {
        topStoriesDataService = TopStoriesDataService()
    }

    // MARK: - Custom methods
    func fetchTopStories() {
        topStoriesDataService?.fetchTopStories(for: .arts, completion: { result in
            switch result {
            case .success(let stories):
                DispatchQueue.main.async {
                    self.stories = stories
                }
            case .failure(let error):
                print("Failed to fetch stroies data: \(error.localizedDescription)")
            }
        })
    }
}
