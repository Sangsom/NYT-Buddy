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
