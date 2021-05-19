//
//  Emoji_Widget.swift
//  Emoji Widget
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import WidgetKit
import SwiftUI

struct EmojiEntry: TimelineEntry {
    let date: Date
    let emoji: Emoji
}

struct Provider: TimelineProvider {
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.dev.domanov.NYT-Buddy"))
    var emojiData: Data = Data()

    func placeholder(in context: Context) -> EmojiEntry {
        EmojiEntry(date: Date(), emoji: Emoji(icon: "🐻", name: "N/A", description: "N/A"))
    }

    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(date: Date(), emoji: emoji)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }

        let entry = EmojiEntry(date: Date(), emoji: emoji)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry

    @Environment(\.widgetFamily) var family: WidgetFamily

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall: EmojiView(emoji: entry.emoji)
        case .systemMedium: MediumEmojiView(emoji: entry.emoji)
        case .systemLarge: LargeEmojiView(emoji: entry.emoji)
        default: EmojiView(emoji: entry.emoji)
        }
    }
}

@main
struct EmojiWidget: Widget {
    private let kind = "EmojiWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
