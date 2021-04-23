//
//  Period.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

enum Period: Int, CaseIterable, Identifiable {
    case daily = 1
    case weekly = 7
    case monthly = 30

    var id: Int { self.rawValue }
    var stringValue: String {
        let dayString = self.rawValue == 1 ? "day" : "days"
        return "\(self.rawValue) \(dayString)"
    }
}
