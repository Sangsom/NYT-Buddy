//
//  BooksByListData.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 12/05/2021.
//

import Foundation

struct BooksByListData: Codable {
    let status: String
    let results: BooksByListResults
}
