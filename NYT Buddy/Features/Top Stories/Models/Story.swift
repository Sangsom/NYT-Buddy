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
