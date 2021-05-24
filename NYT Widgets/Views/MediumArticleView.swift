//
//  MediumArticleView.swift
//  NYT WidgetsExtension
//
//  Created by Rinalds Domanovs on 24/05/2021.
//

import SwiftUI

struct MediumArticleView: View {
    let article: MostPopularArticle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title)
                .fontWeight(.medium)

            Text(article.abstract)

            HStack {
                Spacer()
                Text(article.published)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

        }
        .padding()
    }
}
