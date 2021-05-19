//
//  MediumEmojiView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import SwiftUI

struct MediumEmojiView: View {
    let emoji: Emoji

    var body: some View {
        HStack(spacing: 30) {
            EmojiView(emoji: emoji)

            Text(emoji.name)
                .font(.largeTitle)
        }
    }
}

struct MediumEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        MediumEmojiView(emoji: Emoji(icon: "🐻", name: "N/A", description: "N/A"))
            .previewLayout(.sizeThatFits)
    }
}
