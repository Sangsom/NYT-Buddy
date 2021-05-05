//
//  TopStoriesViewModel.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

// TODO: How to store stories for every category???

class TopStoriesViewModel: ObservableObject {
    // MARK: - Properties
    var topStoriesDataService: TopStoriesDataService?

    @Published var stories = [Story]()

    @Published var storyData = [StoryData]()

    // MARK: - Init
    init() {
        topStoriesDataService = TopStoriesDataService()
    }

    // MARK: - Custom methods
    func fetchTopStories(for section: Section) {
        topStoriesDataService?.fetchTopStories(for: section, completion: { result in
            switch result {
            case .success(let stories):
                DispatchQueue.main.async {
//                    self.stories = stories
                    self.storyData.append(stories)
                }
            case .failure(let error):
                print("Failed to fetch stories data: \(error.localizedDescription)")
            }
        })
    }
}
