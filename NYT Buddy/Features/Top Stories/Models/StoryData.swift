//
//  StoryData.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

struct StoryData: Codable, Hashable, Identifiable {
    let status: String
    let section: String
    let results: [Story]
    var id: String { section }
}

#if DEBUG
extension StoryData {
    static let exampleData = StoryData(
        status: "OK",
        section: "Arts",
        results: Array(repeating: Story.exampleData, count: 5))
}
#endif
