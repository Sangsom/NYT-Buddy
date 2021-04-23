//
//  ArticleListItem.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import SwiftUI

struct ArticleListItem: View {
    var article: MostPopularArticle

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(article.title)
                .font(.title2)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)

            Text(article.abstract)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
    }
}

struct ArticleListItem_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListItem(article: MostPopularArticle.exampleData.first!)
            .previewLayout(.sizeThatFits)
    }
}
