//
//  BooksDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import Foundation

class BooksDataService {
    // MARK: - Custom methods
    func fetchOverview(completion: @escaping (Result<[BooksOverviewResults.List], NetworkError>) -> Void) {

        guard let url = createURL() else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let response = try? JSONDecoder().decode(BooksOverviewData.self, from: data)

            if let response = response {
                completion(.success(response.results.lists))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    func fetchBooksByList(_ listName: String, completion: @escaping (Result<BooksByListResults, NetworkError>) -> Void) {
        guard let url = createURL(for: listName) else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)
        print(request)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            let response = try? JSONDecoder().decode(BooksByListData.self, from: data)

            if let response = response {
                completion(.success(response.results))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    func createURL(for listName: String? = nil) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nytimes.com"

        if let listName = listName {
            urlComponents.path = "/svc/books/v3/lists/\(listName).json"
        } else {
            urlComponents.path = "/svc/books/v3/lists/overview.json"
        }

        let apiQueryItem = URLQueryItem(name: "api-key", value: Constants.API.NYT_API_KEY)
        urlComponents.queryItems = [apiQueryItem]

        return urlComponents.url
    }
}
