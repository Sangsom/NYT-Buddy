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
                    ForEach(topStoriesViewModel
                                .storyData
                                .filter({ $0.section.lowercased() == section.rawValue }))
                    { storyData in
                        StoriesScrollViewItem(storyData: storyData)
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
        topStoriesViewModel.fetchTopStories(for: section)
    }
}

struct StoriesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesScrollView(section: .arts)
            .environmentObject(TopStoriesViewModel())
            .previewLayout(.sizeThatFits)
    }
}
