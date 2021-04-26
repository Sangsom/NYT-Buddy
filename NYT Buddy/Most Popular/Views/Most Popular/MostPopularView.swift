//
//  ContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

struct MostPopularView: View {
    @EnvironmentObject var mostPopularViewModel: MostPopularViewModel

    @State private var selectedArticle: MostPopularArticle?

    var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    SelectPeriodView()
                        .padding(.horizontal)
                        .onChange(of: mostPopularViewModel.selectedPeriod, perform: { _ in
                            self.loadData()
                        })

                    List(mostPopularViewModel.articles, id: \.self, selection: $selectedArticle) { article in
                        NavigationLink(
                            destination: ArticleView(article: article),
                            tag: article,
                            selection: $selectedArticle,
                            label: {ArticleListItem(article: article)})
                    }
                }
                .blur(radius: mostPopularViewModel.state == .loading ? 4 : 0)
                .disabled(mostPopularViewModel.state == .loading)

                if mostPopularViewModel.state == .loading {
                    LoadingView()
                }
            }
            .onAppear(perform: loadData)
            .onDisappear(perform: deselectRow)
            .navigationTitle("Most Popular")
    }

    private func loadData() {
        mostPopularViewModel.fetchMostPopularArticles()
    }

    private func deselectRow() {
        self.selectedArticle = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView()
            .environmentObject(MostPopularViewModel())
    }
}
