//
//  StoryDetailsView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 30/04/2021.
//

import SwiftUI

struct StoryDetailsView: View {

    // MARK: - Properties
    @Environment(\.openURL) var openURL

    var story: Story

    // MARK: - Body
    var body: some View {
        Text("Hello, World!")
    }

    // MARK: - Custom methods
}

// MARK: - Preview
struct StoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailsView(story: Story.exampleData)
    }
}
