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
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .center) {
                Text(story.section.capitalized)
                    .bold()
                    .underline(true, color: Color("UnderlineColor"))

                if let subsection = story.subsection,
                   !subsection.isEmpty {
                    Image(systemName: "arrow.right")
                    Text(subsection.capitalized)
                        .bold()
                        .underline(true, color: .red)
                }

                Spacer()
                Text(story.publishedFormatted)
            }
            .padding(.top)
            .foregroundColor(Color("AccentColor"))

            Text(story.title)
                .font(.title)
                .fontWeight(.medium)

            Text(story.abstract)
                .font(.body)

            HStack(alignment: .center) {
                Text(story.byline)
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: openFullStory) {
                    Text("Full story")
                }
            }

//            MediaView(media: story.multimedia)

            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .padding(.horizontal)
    }

    // MARK: - Custom methods
    func openFullStory() {
        guard let url = story.url else { return }
        openURL(url)
    }
}

// MARK: - Preview
struct StoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailsView(story: Story.exampleData)
    }
}
