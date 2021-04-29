//
//  TopStoriesDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import Foundation

class TopStoriesDataService {
    func fetchTopStories(for section: Section, completion: @escaping (Result<[Story], NetworkError>) -> Void) {

        guard let url = createURL(for: section)  else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            print("Data", data)

            let response = try? JSONDecoder().decode(StoryData.self, from: data)

            print("Response", response)

            if let response = response {
                completion(.success(response.results))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }

    func createURL(for section: Section) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nytimes.com"
        urlComponents.path = "/svc/topstories/v2/\(section.rawValue).json"

        let apiQueryItem = URLQueryItem(name: "api-key", value: Constants.API.NYT_API_KEY)
        urlComponents.queryItems = [apiQueryItem]

        return urlComponents.url
    }
}
