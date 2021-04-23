//
//  MostPopularDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 23/04/2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

protocol DataService {
    func fetchMostViewedArticles(completion: @escaping (Result<[MostPopularArticle], NetworkError>) -> Void)
}

class MostPopularDataService: DataService {
    private(set) var period: Period.RawValue

    init(period: Period.RawValue) {
        self.period = period
    }

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

    private func createURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nytimes.com"
        urlComponents.path = "/svc/mostpopular/v2/viewed/\(period).json"

        let apiQueryItem = URLQueryItem(name: "api-key", value: "10se5TvsUG7aG7rr31AxOcme0SEZOQ9q")
        urlComponents.queryItems = [apiQueryItem]

        return urlComponents.url
    }

    func updatePeriod(_ period: Period.RawValue) {
        self.period = period
    }
}
