//
//  BookList.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import Foundation

struct BookList: Codable {
    var listName: String
    var displayName: String
    var listNameEncoded: String
    var oldestPublishedDate: String
    var newestPublishedDate: String
    var updated: BookUpdate

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}

#if DEBUG
extension BookList {
    static let exampleData = BookList(
        listName: "Combined Print and E-Book Fiction",
        displayName: "Combined Print & E-Book Fiction",
        listNameEncoded: "combined-print-and-e-book-fiction",
        oldestPublishedDate: "2011-02-13",
        newestPublishedDate: "2021-05-16",
        updated: .WEEKLY)
}
#endif
