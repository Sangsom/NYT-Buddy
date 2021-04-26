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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: MostPopularArticle.exampleData.first!)
    }
}
