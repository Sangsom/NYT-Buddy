//
//  ShowAllStoriesView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 30/04/2021.
//

import SwiftUI

struct ShowAllStoriesView: View {
    var stories: [Story]

    var body: some View {
        Text("Hello, World!")
    }
}

struct ShowAllStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ShowAllStoriesView(stories: Array(repeating: Story.exampleData, count: 15))
    }
}
