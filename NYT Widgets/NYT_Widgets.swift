//
//  NYT_Widgets.swift
//  NYT Widgets
//
//  Created by Rinalds Domanovs on 19/05/2021.
//

import WidgetKit
import SwiftUI

struct NYTEntry: TimelineEntry {
    let date: Date
    let article: MostPopularArticle
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> NYTEntry {
        NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!)
    }

    func getSnapshot(in context: Context, completion: @escaping (NYTEntry) -> Void) {
        let entry = NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<NYTEntry>) -> Void) {
        let entry = NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        VStack(spacing: 8) {
            Text(entry.article.title)
                .lineLimit(4)

            HStack {
                Spacer()
                Text(entry.article.published)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

        }
        .padding()
    }
}

@main
struct NYT_Widgets: Widget {
    let kind: String = "NYT_Widgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            WidgetEntryView(entry: entry)
        }
    }
}

struct NYT_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView(entry: NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
