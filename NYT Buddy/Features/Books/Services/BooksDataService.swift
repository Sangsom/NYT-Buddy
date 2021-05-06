//
//  BooksDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 06/05/2021.
//

import Foundation

class BooksDataService {
    // MARK: - Custom methods
    func fetchListNames(completion: @escaping (Result<[BookList], NetworkError>) -> Void) {

        guard let url = createURL() else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let response = try? JSONDecoder().decode(BooksData.self, from: data)

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
        urlComponents.path = "/svc/books/v3/lists/names.json"

        let apiQueryItem = URLQueryItem(name: "api-key", value: Constants.API.NYT_API_KEY)
        urlComponents.queryItems = [apiQueryItem]

        return urlComponents.url
    }
}
