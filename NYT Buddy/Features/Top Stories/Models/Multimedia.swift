//
//  Multimedia.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import Foundation

struct Multimedia: Codable, Hashable {
    var url: URL
    var format: String
    var type: String
    var caption: String
    var copyright: String
}
