//
//  Emoji.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String

    var id: String { icon }
}
