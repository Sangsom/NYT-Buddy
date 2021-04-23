//
//  MostPopularData.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

struct MostPopularData: Codable {
    let status: String
    let results: [MostPopularArticle]
}

struct MostPopularArticle: Codable, Identifiable {
    var id: Int
    var title: String
    var abstract: String
}
