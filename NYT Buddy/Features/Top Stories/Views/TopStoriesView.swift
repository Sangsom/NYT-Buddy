//
//  TopStoriesView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import SwiftUI

struct TopStoriesView: View {
    var body: some View {
        StoriesScrollView(section: .arts)
    }
}

struct TopStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TopStoriesView()
    }
}
