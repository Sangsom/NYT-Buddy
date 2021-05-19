//
//  EmojiContentView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import SwiftUI

struct EmojiContentView: View {

    @AppStorage("emoji", store: UserDefaults(suiteName: "group.dev.domanov.NYT-Buddy"))
    var emojiData: Data = Data()

    let emojis = [
        Emoji(icon: "🐻", name: "Bear", description: "This means the user is about that life!"),
        Emoji(icon: "🐨", name: "Koala", description: "That just happened; right here in front of me..."),
        Emoji(icon: "🐭", name: "Mouse", description: "Completely done with your ish Karen!")
    ]

    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
        }
    }

    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else {
            print("Failed")
            return

        }
        self.emojiData = emojiData
        print("Saved \(emoji)")
    }
}

struct EmojiContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiContentView()
    }
}
