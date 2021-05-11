//
//  BooksByListView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 10/05/2021.
//

import SwiftUI

struct BooksByListView: View {
    let listName: String

    var body: some View {
        Text(listName)
    }
}

struct BooksByListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksByListView(listName: "combined-print-and-e-book-fiction")
    }
}
