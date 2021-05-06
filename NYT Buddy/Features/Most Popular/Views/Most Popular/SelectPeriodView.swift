//
//  SelectPeriodView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 24/04/2021.
//

import SwiftUI


struct SelectPeriodView: View {
    @EnvironmentObject var mostPopularViewModel: MostPopularViewModel

    var body: some View {
        Picker("Period", selection: $mostPopularViewModel.selectedPeriod) {
            ForEach(Period.allCases) { period in
                Text(period.stringValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct SelectPeriodView_Previews: PreviewProvider {
    static var previews: some View {
        SelectPeriodView()
            .environmentObject(MostPopularViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
