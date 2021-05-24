//
//  LargeArticleView.swift
//  NYT WidgetsExtension
//
//  Created by Rinalds Domanovs on 24/05/2021.
//

import SwiftUI

struct LargeArticleView: View {
    let articles: [MostPopularArticle]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(articles.prefix(3)) { article in
                Text(article.title)
                    .fontWeight(.medium)

                Text(article.abstract)

                HStack {
                    Spacer()
                    Text(article.publishedDateFormatted)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
    }
}
