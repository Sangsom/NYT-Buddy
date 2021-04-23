//
//  ContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

enum Period: Int, CaseIterable, Identifiable {
    case daily = 1
    case weekly = 7
    case monthly = 30

    var id: Int { self.rawValue }
    var stringValue: String {
        let dayString = self.rawValue == 1 ? "day" : "days"
        return "\(self.rawValue) \(dayString)"
    }
}

struct MostPopularView: View {
    @EnvironmentObject var mostPopularViewModel: MostPopularViewModel
    @State private var selectedPeriod = Period.daily.rawValue

    var body: some View {
        VStack {
            Picker("Period", selection: $selectedPeriod) {
                ForEach(Period.allCases) { period in
                    Text(period.stringValue)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .pickerStyle(SegmentedPickerStyle())

            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 20.0) {
                    ForEach(mostPopularViewModel.articles) { article in
                        ArticleListItem(article: article)
                    }
                }
                .padding(.horizontal)
                .onAppear(perform: loadData)
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
