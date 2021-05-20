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
        SmallArticleView(article: entry.article)
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
    static let article = MostPopularArticle.exampleData.first!

    static var previews: some View {
        Group {
            WidgetEntryView(
                entry: NYTEntry(
                    date: Date(),
                    article: article)
            )
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
