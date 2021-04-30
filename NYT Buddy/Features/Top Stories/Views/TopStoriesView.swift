//
//  TopStoriesView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import SwiftUI

struct TopStoriesView: View {
    @EnvironmentObject var topStoriesViewModel: TopStoriesViewModel

    var body: some View {
        StoriesScrollView(stories: $topStoriesViewModel.stories)
            .onAppear(perform: loadData)
    }

    // MARK: - Custom methods
    private func loadData() {
        topStoriesViewModel.fetchTopStories()
    }
}

struct TopStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TopStoriesView()
            .environmentObject(TopStoriesViewModel())
    }
}
