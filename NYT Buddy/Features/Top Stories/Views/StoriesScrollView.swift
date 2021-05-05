//
//  StoriesScrollView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 29/04/2021.
//

import SwiftUI

struct StoriesScrollView: View {
    @EnvironmentObject var topStoriesViewModel: TopStoriesViewModel

    var section: Section
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.rawValue)
                .font(.headline)
                .textCase(.uppercase)

            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack(alignment: .top, spacing: 20.0) {
                    ForEach(topStoriesViewModel.stories.prefix(5), id: \.self) { story in
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
            })

//            HStack {
//                Spacer()
//                NavigationLink(
//                    destination: ShowAllStoriesView(stories: stories),
//                    label: {
//                        Text("Show all")
//                    })
//            }
        }
        .onAppear(perform: loadData)
        .padding(.horizontal)
    }

    // MARK: - Custom methods
    private func loadData() {
        topStoriesViewModel.fetchTopStories()
    }
}

struct StoriesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesScrollView(section: .arts)
            .environmentObject(TopStoriesViewModel())
            .previewLayout(.sizeThatFits)
    }
}
