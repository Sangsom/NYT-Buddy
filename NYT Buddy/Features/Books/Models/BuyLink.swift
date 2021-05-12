//
//  BuyLink.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 10/05/2021.
//

import Foundation

struct BuyLink: Codable, Hashable {
    let name: String
    let url: URL
}

#if DEBUG
extension BuyLink {
    static let exampleData = BuyLink(
        name: "Amazon",
        url: URL(string: "https://www.amazon.com/dp/0385547684?tag=NYTBSREV-20")!)
}
#endif
