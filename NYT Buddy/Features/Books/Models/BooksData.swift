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

struct BooksOverviewResults: Codable {
    var bestSellersDate: String
    var publishedDate: String
    var lists: [List]

    enum CodingKeys: String, CodingKey {
        case bestSellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case lists
    }

    struct List: Codable, Identifiable {
        var id: Int
        var name: String
        var updated: BookUpdate
        var image: String?
        var books: [Book]

        enum CodingKeys: String, CodingKey {
            case id = "list_id"
            case name = "display_name"
            case updated
            case image = "list_image"
            case books
        }

        #if DEBUG
        static let exampleData = List(id: 704, name: "Combined Print & E-Book Fiction", updated: .WEEKLY, image: nil, books: Array(repeating: Book.exampleData, count: 5))
        #endif
    }

    struct Book: Codable {
        var ageGroup: String
        var author: String
        var contributor: String
        var contributorNote: String
        var created: String
        var description: String
        var price: String
        var isbn13: String
        var isbn10: String
        var publisher: String
        var rank: Int
        var title: String
        var updated: String

        enum CodingKeys: String, CodingKey {
            case ageGroup = "age_group"
            case author
            case contributor
            case contributorNote = "contributor_note"
            case created = "created_date"
            case description
            case price
            case isbn13 = "primary_isbn13"
            case isbn10 = "primary_isbn10"
            case publisher
            case rank
            case title
            case updated = "updated_date"
        }

        #if DEBUG
        static let exampleData = Book(ageGroup: "", author: "John Grisham", contributor: "by John Grisham", contributorNote: "", created: "2021-05-05 22:17:28", description: "Samuel Sooleymon receives a basketball scholarship to North Carolina Central and determines to bring his family over from a civil war-ravaged South Sudan.", price: "0.0", isbn13: "9780385547680", isbn10: "0385547684", publisher: "Doubleday", rank: 1, title: "SOOLEY", updated: "2021-05-05 22:21:53")
        #endif
    }
}
