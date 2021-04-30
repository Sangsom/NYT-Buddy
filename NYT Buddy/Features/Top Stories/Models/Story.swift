//
//  Story.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

struct Story: Codable, Hashable {
    var section: String
    var subsection: String?
    var title: String
    var abstract: String
    var url: URL?
    var byline: String
    var published: String
    var multimedia: [Multimedia]?

    var publishedFormatted: String {
        let isoDateFormatter = ISO8601DateFormatter()
        if let date = isoDateFormatter.date(from: published) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.dateFormat = "yyyy-MM-dd"

            return dateFormatter.string(from: date)
        } else {
            return "N/A"
        }
    }

    enum CodingKeys: String, CodingKey {
        case section
        case subsection
        case title
        case abstract
        case url
        case byline
        case published = "published_date"
        case multimedia
    }
}

#if DEBUG
extension Story {
    static let exampleData = Story(
        section: "theater",
        subsection: "cinema",
        title: "Renée Fleming Was Back Onstage. Here’s What Happened First.",
        abstract: "To pull together a 85-minute indoor concert at the Shed with the opera star and three musicians, everything had to go according to plan.",
        url: URL(string: "https://www.nytimes.com/2021/04/28/theater/renee-fleming-the-shed.html")!,
        byline: "By Julia Jacobs",
        published: "2021-04-28T05:00:35-04:00",
        multimedia: Array(repeating: Multimedia.exampleData, count: 3))
}
#endif
