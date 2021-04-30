//
//  MultimediaView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 30/04/2021.
//

import SwiftUI

struct MultimediaView: View {
    var multimedia: [Multimedia]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MultimediaView_Previews: PreviewProvider {
    static var previews: some View {
        MultimediaView(multimedia: Array(repeating: Multimedia.exampleData, count: 5))
    }
}
