//
//  NYT_BuddyApp.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

@main
struct NYT_BuddyApp: App {
    @StateObject var mostPopularViewModel = MostPopularViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MostPopularView()
                    .environmentObject(mostPopularViewModel)
            }
        }
    }
}
