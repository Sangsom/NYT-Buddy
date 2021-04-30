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
        VStack(alignment: .leading, spacing: 20, content: {
            List(stories, id: \.self) { story in
                NavigationLink(
                    destination: StoryDetailsView(story: story),
                    label: {
                        StoryListItem(story: story)
                    })
            }
            .listStyle(InsetGroupedListStyle())
        })
        .navigationBarTitle("Arts", displayMode: .inline)
    }
}

struct ShowAllStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShowAllStoriesView(stories: Array(repeating: Story.exampleData, count: 15))
        }
    }
}
