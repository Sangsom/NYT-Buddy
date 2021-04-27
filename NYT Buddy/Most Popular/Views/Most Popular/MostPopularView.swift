//
//  ContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

struct MostPopularView: View {
    @EnvironmentObject var mostPopularViewModel: MostPopularViewModel

    var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    SelectPeriodView()
                        .padding(.horizontal)
                        .onChange(of: mostPopularViewModel.selectedPeriod, perform: { _ in
                            self.loadData()
                        })
                        .zIndex(1.0)
                    
                    List(mostPopularViewModel.articles) { article in
                        NavigationLink(
                            destination: ArticleView(article: article),
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
            .navigationTitle("Most Popular")
    }

    private func loadData() {
        mostPopularViewModel.fetchMostPopularArticles()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView()
            .environmentObject(MostPopularViewModel())
    }
}
