//
//  StoriesScrollViewItem.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 05/05/2021.
//

import SwiftUI

struct StoriesScrollViewItem: View {
    var storyData: StoryData

    var body: some View {
        ForEach(storyData.results.prefix(5)) { story in
            NavigationLink(
                destination: StoryDetailsView(story: story),
                label: {
                    VStack(spacing: 8) {
                        if let multimedia = story.multimedia,
                           let firstItem = multimedia.first {
                            RemoteImage(url: firstItem.url.absoluteString, size: CGSize(width: 150, height: 150))
                        }
                        Text(story.title)
                            .foregroundColor(.primary)

                        Spacer()
                    }
                    .frame(width: 150, height: 250)
                })
        }
    }
}

struct StoriesScrollViewItem_Previews: PreviewProvider {
    static var previews: some View {
        StoriesScrollViewItem(storyData: StoryData.exampleData)
    }
}
