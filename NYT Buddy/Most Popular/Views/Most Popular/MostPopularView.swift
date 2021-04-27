//
//  ContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

struct MostPopularView: View {
    @EnvironmentObject var mostPopularViewModel: MostPopularViewModel

    @State private var showActionSheet = false

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
            .navigationBarItems(trailing:
                    Button(action: {
                        showActionSheet = true
                    }, label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                )
                .buttonStyle(PlainButtonStyle())
            )
            .actionSheet(isPresented: $showActionSheet, content: {
                ActionSheet(
                    title: Text("Get most popular articles"),
                    message: nil,
                    buttons: [
                        .cancel(),
                        .default(Text("Most emailed articles"), action: {
                            mostPopularViewModel.selectedArticleType = .emailed
                        }),
                        .default(Text("Most shared articles on Facebook"), action: {
                            mostPopularViewModel.selectedArticleType = .shared
                        }),
                        .default(Text("Most viewed articles"), action: {
                            mostPopularViewModel.selectedArticleType = .viewed
                        })
                    ])
            })
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
