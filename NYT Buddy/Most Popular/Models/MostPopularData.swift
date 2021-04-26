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
    let id: Int
    var title: String
    var abstract: String
    var views: Int?

    var published: String
    var section: String
    var byline: String
    var media: [Media]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case abstract
        case views

        case published = "published_date"
        case section
        case byline
        case media
    }
}

struct Media: Codable {
    var type: String
    var subtype: String
    var caption: String
    var copyright: String

    var mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright

        case mediaMetadata = "media-metadata"
    }

    static let exampleData = Media(type: "image", subtype: "photo", caption: "Syringes with the Pfizer vaccine are ready to be distributed in Dearborn, Mich.", copyright: "Emily Rose Bennett for The New York Times", mediaMetadata: MediaMetadata.exampleData)
}

struct MediaMetadata: Codable {
    var url: URL
    var format: String

    static let exampleData = [
        MediaMetadata(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-thumbStandard.jpg")!, format: "Standard Thumbnail"),
        MediaMetadata(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-mediumThreeByTwo210.jpg")!, format: "mediumThreeByTwo210"),
        MediaMetadata(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-mediumThreeByTwo440.jpg")!, format: "mediumThreeByTwo440")
    ]
}

// MARK: - Sample Data
#if DEBUG
extension MostPopularArticle {
    static let exampleData = [
        MostPopularArticle(id: 100000007706389, title: "Johnson & Johnson Vaccinations Paused After Rare Clotting Cases Emerge", abstract: "Federal health officials called for a halt in the use of the company’s coronavirus vaccine while they study serious illnesses that developed in six American women.", views: 1511, published: "2021-04-25", section: "Business", byline: "By Rebecca Robbins", media: [Media.exampleData]),
        MostPopularArticle(id: 100000007682408, title: "Matt Gaetz Is Said to Face Justice Dept. Inquiry Over Sex With an Underage Girl", abstract: "An inquiry into the Florida congressman was opened in the final months of the Trump administration, people briefed on it said.", views: 9999, published: "2021-04-25", section: "Business", byline: "By Rebecca Robbins", media: [Media.exampleData]),
        MostPopularArticle(id: 100000007694130, title: "There’s a Name for the Blah You’re Feeling: It’s Called Languishing", abstract: "The neglected middle child of mental health can dull your motivation and focus — and it may be the dominant emotion of 2021.", views: 15, published: "2021-04-25", section: "Business", byline: "By Rebecca Robbins", media: [Media.exampleData])
    ]
}
#endif
