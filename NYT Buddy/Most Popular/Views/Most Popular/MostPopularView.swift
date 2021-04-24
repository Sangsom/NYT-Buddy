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
            VStack(spacing: 20) {
                SelectPeriodView()
                    .onChange(of: mostPopularViewModel.selectedPeriod, perform: { _ in
                        self.loadData()
                    })

                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 20.0) {
                        ForEach(mostPopularViewModel.articles) { article in
                            ArticleListItem(article: article)
                        }
                    }
                    .onAppear(perform: loadData)
                }
            }
            .padding(.horizontal)
            .blur(radius: mostPopularViewModel.state == .loading ? 4 : 0)
            .disabled(mostPopularViewModel.state == .loading)

            if mostPopularViewModel.state == .loading {
                LoadingView()
            }
        }
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
