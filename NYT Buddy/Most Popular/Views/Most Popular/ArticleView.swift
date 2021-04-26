//
//  ArticleView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 26/04/2021.
//

import SwiftUI

struct ArticleView: View {
    var article: MostPopularArticle

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack {
                Text(article.section)
                    .foregroundColor(.secondary)
                    .bold()

                Spacer()
                Text(article.published)
                    .foregroundColor(.secondary)
            }
            Text(article.title)
                .font(.title)
                .fontWeight(.medium)

            Text(article.abstract)
                .font(.body)

            Spacer()
        }
        .navigationTitle("")
        .padding(.horizontal)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: MostPopularArticle.exampleData.first!)
    }
}
