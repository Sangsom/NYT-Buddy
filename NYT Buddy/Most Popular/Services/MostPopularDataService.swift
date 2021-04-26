//
//  MostPopularDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

protocol DataService {
    func fetchMostViewedArticles(completion: @escaping (Result<[MostPopularArticle], NetworkError>) -> Void)
    func createURL() -> URL?
}

class MostPopularDataService: DataService {
    // MARK: - Properties
    private(set) var period: Period.RawValue

    init(period: Period.RawValue) {
        self.period = period
    }

    // MARK: - Custom methods
    func fetchMostViewedArticles(completion: @escaping (Result<[MostPopularArticle], NetworkError>) -> Void) {
        guard let url = createURL() else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            let response = try? JSONDecoder().decode(MostPopularData.self, from: data)

            if let response = response {
                completion(.success(response.results))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    func createURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nytimes.com"
        urlComponents.path = "/svc/mostpopular/v2/viewed/\(period).json"

        let apiQueryItem = URLQueryItem(name: "api-key", value: Constants.API.NYT_API_KEY)
        urlComponents.queryItems = [apiQueryItem]

        return urlComponents.url
    }

    func updatePeriod(_ period: Period.RawValue) {
        self.period = period
    }
}
