//
//  ArticleView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 26/04/2021.
//

import SwiftUI

struct ArticleView: View {
    @Environment(\.openURL) var openURL

    var article: MostPopularArticle

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .center) {
                Text(article.section)
                    .bold()
                    .underline(true, color: .red)

                if let subsection = article.subsection,
                   !subsection.isEmpty {
                    Image(systemName: "arrow.right")
                    Text(subsection)
                        .bold()
                        .underline(true, color: .red)
                }

                Spacer()
                Text(article.published)
            }
            .padding(.top)
            .foregroundColor(Color("AccentColor"))

            KeywordsListView(keywords: article.keywordsList)

            Text(article.title)
                .font(.title)
                .fontWeight(.medium)

            Text(article.abstract)
                .font(.body)

            HStack(alignment: .center) {
                Text(article.byline)
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: openFullArticle) {
                    Text("Full article")
                }
            }

            MediaView(media: article.media)

            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .padding(.horizontal)
    }

    func openFullArticle() {
        guard let url = article.url else { return }
        openURL(url)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticleView(article: MostPopularArticle.exampleData.first!)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
