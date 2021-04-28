//
//  KeywordsListView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 26/04/2021.
//

import SwiftUI

struct KeywordsListView: View {
    var keywords: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(keywords, id: \.self) { keyword in
                    Text(keyword)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color.secondary)
                        )
                }
            }
        })
    }
}

struct KeywordsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KeywordsListView(keywords: ["Coronavirus (2019-nCoV)", "Vaccination and Immunization", "Drugs (Pharmaceuticals)", "Offit, Paul A", "Centers for Disease Control and Prevention", "Moderna Inc", "Pfizer Inc", "Walgreen Co"])
                .preferredColorScheme(.light)

            KeywordsListView(keywords: ["Coronavirus (2019-nCoV)", "Vaccination and Immunization", "Drugs (Pharmaceuticals)", "Offit, Paul A", "Centers for Disease Control and Prevention", "Moderna Inc", "Pfizer Inc", "Walgreen Co"])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
