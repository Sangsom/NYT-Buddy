//
//  MostPopularArticle.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import Foundation

struct MostPopularArticle: Codable, Identifiable, Hashable {
    let id: Int
    var title: String
    var abstract: String

    var url: URL?
    var published: String
    var section: String
    var subsection: String?
    var byline: String
    var media: [Media]
    var keywords: String

    var keywordsList: [String] {
        return keywords.split(separator: ";").map({ String($0) })
    }

    var publishedDateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatter.date(from: published) {
            let newFormatter = DateFormatter()
            newFormatter.dateFormat = "dd MMM yyyy"

            return newFormatter.string(from: date)
        }

        return published
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case abstract

        case url
        case published = "published_date"
        case section
        case subsection
        case byline
        case media
        case keywords = "adx_keywords"
    }
}

// MARK: - Sample Data
#if DEBUG
extension MostPopularArticle {
    static let exampleData = [
        MostPopularArticle(id: 100000007706389, title: "Johnson & Johnson Vaccinations Paused After Rare Clotting Cases Emerge", abstract: "Federal health officials called for a halt in the use of the company’s coronavirus vaccine while they study serious illnesses that developed in six American women.", published: "2021-04-25", section: "World", subsection: "Europe", byline: "By Rebecca Robbins", media: [Media.exampleData], keywords: "Coronavirus (2019-nCoV);Vaccination and Immunization;Drugs (Pharmaceuticals);Offit, Paul A;Centers for Disease Control and Prevention;Moderna Inc;Pfizer Inc;Walgreen Co"),
        MostPopularArticle(id: 100000007682408, title: "Matt Gaetz Is Said to Face Justice Dept. Inquiry Over Sex With an Underage Girl", abstract: "An inquiry into the Florida congressman was opened in the final months of the Trump administration, people briefed on it said.", published: "2021-04-25", section: "Business", byline: "By Rebecca Robbins", media: [Media.exampleData], keywords: "Coronavirus (2019-nCoV);Vaccination and Immunization;Drugs (Pharmaceuticals);Offit, Paul A;Centers for Disease Control and Prevention;Moderna Inc;Pfizer Inc;Walgreen Co"),
        MostPopularArticle(id: 100000007694130, title: "There’s a Name for the Blah You’re Feeling: It’s Called Languishing", abstract: "The neglected middle child of mental health can dull your motivation and focus — and it may be the dominant emotion of 2021.", published: "2021-04-25", section: "Business", byline: "By Rebecca Robbins", media: [Media.exampleData], keywords: "Coronavirus (2019-nCoV);Vaccination and Immunization;Drugs (Pharmaceuticals);Offit, Paul A;Centers for Disease Control and Prevention;Moderna Inc;Pfizer Inc;Walgreen Co")
    ]
}
#endif
