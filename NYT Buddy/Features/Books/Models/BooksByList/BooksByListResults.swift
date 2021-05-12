//
//  BooksByListResults.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 12/05/2021.
//

import Foundation

struct BooksByListResults: Codable {
    var name: String
    var listNameEncoded: String
    var updated: BookUpdate
    var books: [Book]

    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case listNameEncoded = "list_name_encoded"
        case updated
        case books
    }

    struct Book: Codable {
        var rank: Int
        var isbn13: String
        var isbn10: String
        var publisher: String
        var description: String
        var title: String
        var author: String
        var contributor: String
        var bookImage: URL
        var buyLinks: [BuyLink]

        enum CodingKeys: String, CodingKey {
            case rank
            case isbn13 = "primary_isbn13"
            case isbn10 = "primary_isbn10"
            case publisher
            case description
            case title
            case author
            case contributor
            case bookImage = "book_image"
            case buyLinks = "buy_links"
        }
    }
}
