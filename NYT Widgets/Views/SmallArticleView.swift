//
//  SmallArticleView.swift
//  NYT WidgetsExtension
//
//  Created by Rinalds Domanovs on 20/05/2021.
//

import SwiftUI

struct SmallArticleView: View {
    let article: MostPopularArticle

    var body: some View {
        VStack(spacing: 8) {
            Text(article.title)
                .lineLimit(4)

            HStack {
                Spacer()
                Text(article.publishedDateFormatted)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

        }
        .padding()
    }
}
