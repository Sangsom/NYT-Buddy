//
//  LargeEmojiView.swift
//  Emoji WidgetExtension
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import SwiftUI

struct LargeEmojiView: View {
    let emoji: Emoji

    var body: some View {
        VStack(spacing: 30) {
            MediumEmojiView(emoji: emoji)

            Text(emoji.description)
                .font(.title2)
        }
    }
}

struct LargeEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        LargeEmojiView(emoji: Emoji(icon: "🐻", name: "N/A", description: "N/A"))
    }
}
