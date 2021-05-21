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

struct Provider: IntentTimelineProvider {
    typealias Entry = NYTEntry
    typealias Intent = SelectMostPopularPeriodIntent

    var mostPopularDataService = MostPopularDataService(period: Period.daily.rawValue)

    func placeholder(in context: Context) -> NYTEntry {
        NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!)
    }

    func getSnapshot(for configuration: SelectMostPopularPeriodIntent, in context: Context, completion: @escaping (NYTEntry) -> Void) {
        let entry = NYTEntry(date: Date(), article: MostPopularArticle.exampleData.first!)
        completion(entry)
    }

    func getTimeline(for configuration: SelectMostPopularPeriodIntent, in context: Context, completion: @escaping (Timeline<NYTEntry>) -> Void) {
        mostPopularDataService.updatePeriod(configuration.period.rawValue)

        mostPopularDataService.fetchMostPopularArticles(for: .viewed) { result in
            switch result {
            case .success(let articles):
                let article = articles.first!
                let entry = NYTEntry(date: Date(), article: article)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            case .failure(_):
                let entry = NYTEntry(date: Date(), article: MostPopularArticle(id: 0, title: "N/A", abstract: "N/A", url: nil, published: "N/A", section: "N/A", subsection: nil, byline: "N/A", media: [Media.exampleData], keywords: "N/A"))
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            }
        }
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
        IntentConfiguration(
            kind: kind,
            intent: SelectMostPopularPeriodIntent.self,
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
