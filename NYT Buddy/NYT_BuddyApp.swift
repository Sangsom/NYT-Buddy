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

    @State private var selectedTab = 0

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab,
                    content:  {
                        NavigationView {
                            MostPopularView()
                                .environmentObject(mostPopularViewModel)
                        }
                        .tag(0)
                        .tabItem {
                            Image(systemName: "newspaper")
                            Text("Popular Articles")
                        }

                        Text("Tab Content 2").tabItem {
                            Image(systemName: "scroll")
                            Text("Top Stories") }.tag(1)
                    })

        }
    }
}
