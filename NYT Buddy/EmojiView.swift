//
//  EmojiView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import SwiftUI

struct EmojiView: View {
    let emoji: Emoji

    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
}
