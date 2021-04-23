//
//  ContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                MostPopularDataService.shared.fetchMostViewedArticles { result in
                    switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .success(let articles):
                        print(articles)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
