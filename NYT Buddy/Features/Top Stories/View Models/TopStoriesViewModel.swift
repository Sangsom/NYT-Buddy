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
                    if let index = self.storyData.firstIndex(where: { $0.section == stories.section }) {
                        self.storyData.remove(at: index)
                        self.storyData.append(stories)
                    } else {
                        self.storyData.append(stories)
                    }
                }
            case .failure(let error):
                print("Failed to fetch stories data: \(error.localizedDescription)")
            }
        })
    }
}
