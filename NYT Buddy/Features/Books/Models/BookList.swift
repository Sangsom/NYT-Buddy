//
//  BookList.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import Foundation

enum BookUpdate {
    case weekly, monthly
}

struct BookList: Codable {
    var listName: String
    var displayName: String
    var listNameEncoded: String
    var oldestPublishedDate: String
    var newestPublishedDate: String

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
    }
}
