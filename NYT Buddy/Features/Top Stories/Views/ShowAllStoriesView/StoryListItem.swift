//
//  StoryListItem.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 30/04/2021.
//

import SwiftUI

struct StoryListItem: View {
    var story: Story

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Text(story.title)
                    .font(.title2)
                    .fontWeight(.medium)
            }

            Text(story.abstract)
                .font(.body)
        }
    }
}

struct StoryListItem_Previews: PreviewProvider {
    static var previews: some View {
        StoryListItem(story: Story.exampleData)
            .previewLayout(.sizeThatFits)
    }
}
