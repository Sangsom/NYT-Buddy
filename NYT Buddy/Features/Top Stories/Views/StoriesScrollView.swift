//
//  StoriesScrollView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import SwiftUI

struct StoriesScrollView: View {
    @Binding var stories: [Story]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Arts")
                .font(.headline)
                .textCase(.uppercase)

            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack(alignment: .top, spacing: 20.0) {
                    ForEach(stories.prefix(5), id: \.self) { story in
                        NavigationLink(
                            destination: StoryDetailsView(story: story),
                            label: {
                                VStack(spacing: 8) {
                                    if let multimedia = story.multimedia,
                                       let firstItem = multimedia.first {
                                        RemoteImage(url: firstItem.url.absoluteString, size: CGSize(width: 150, height: 150))
                                    }
                                    Text(story.title)

                                    Spacer()
                                }
                                .frame(width: 150, height: 250)
                            })
                    }
                }
            })

            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("Show all")
                })
            }
        }
        .padding(.horizontal)
    }
}

struct StoriesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesScrollView(stories: .constant(StoryData.exampleData.results))
            .previewLayout(.sizeThatFits)
    }
}
