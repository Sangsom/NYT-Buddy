//
//  BooksData.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import Foundation

struct BooksOverviewData: Codable {
    let status: String
    let results: BooksOverviewResults
}
