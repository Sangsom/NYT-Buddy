//
//  StoryData.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

struct StoryData: Codable {
    let status: String
    let section: String
    let results: [Story]
}

#if DEBUG
extension StoryData {
    static let exampleData = StoryData(
        status: "OK",
        section: "Arts",
        results: Array(repeating: Story.exampleData, count: 5))
}
#endif
