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
    let articles: [MostPopularArticle]
}

struct Provider: IntentTimelineProvider {
    typealias Entry = NYTEntry
    typealias Intent = SelectMostPopularPeriodIntent

    var mostPopularDataService = MostPopularDataService(period: Period.daily.rawValue)

    func placeholder(in context: Context) -> NYTEntry {
        NYTEntry(date: Date(), articles: MostPopularArticle.exampleData)
    }

    func getSnapshot(for configuration: SelectMostPopularPeriodIntent, in context: Context, completion: @escaping (NYTEntry) -> Void) {
        let entry = NYTEntry(date: Date(), articles: MostPopularArticle.exampleData)
        completion(entry)
    }

    func getTimeline(for configuration: SelectMostPopularPeriodIntent, in context: Context, completion: @escaping (Timeline<NYTEntry>) -> Void) {
        mostPopularDataService.updatePeriod(configuration.period.rawValue)

        let date = Date()
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!

        mostPopularDataService.fetchMostPopularArticles(for: .viewed) { result in
            switch result {
            case .success(let articles):
                let entry = NYTEntry(date: date, articles: articles)
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                completion(timeline)
            case .failure(_):
                let entry = NYTEntry(
                date: date,
                articles: [MostPopularArticle(
                    id: 0,
                    title: "N/A",
                    abstract: "N/A",
                    url: nil,
                    published: "N/A",
                    section: "N/A",
                    subsection: nil,
                    byline: "N/A",
                    media: [Media.exampleData],
                    keywords: "N/A")]
                )
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                completion(timeline)
            }
        }
    }
}

struct WidgetEntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily

    let entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall: SmallArticleView(article: entry.articles.first!)
        case .systemMedium: MediumArticleView(article: entry.articles.first!)
        case .systemLarge: LargeArticleView(articles: entry.articles)
        default: SmallArticleView(article: entry.articles.first!)
        }
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
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("NYT Widget")
        .description("Displays most popular article by selected period.")
    }
}

struct NYT_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetEntryView(
                entry: NYTEntry(
                    date: Date(),
                    articles: MostPopularArticle.exampleData)
            )
            .previewContext(WidgetPreviewContext(family: .systemSmall))

            WidgetEntryView(
                entry: NYTEntry(
                    date: Date(),
                    articles: MostPopularArticle.exampleData)
            )
            .previewContext(WidgetPreviewContext(family: .systemMedium))

            WidgetEntryView(
                entry: NYTEntry(
                    date: Date(),
                    articles: MostPopularArticle.exampleData)
            )
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
