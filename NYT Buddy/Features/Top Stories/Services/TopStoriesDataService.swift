//
//  TopStoriesDataService.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import Foundation

class TopStoriesDataService {
    typealias completionHandler = (Result<StoryData, NetworkError>) -> Void

    var tasks = [URL: [completionHandler]]()

    func fetchTopStories(for section: Section, completion: @escaping completionHandler) {

        guard let url = createURL(for: section)  else {
            return completion(.failure(.badURL))
        }

        let request = URLRequest(url: url)

        if tasks.keys.contains(url) {
            tasks[url]?.append(completion)
        } else {
            tasks[url] = [completion]

            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        return completion(.failure(.noData))
                    }

                    let response = try? JSONDecoder().decode(StoryData.self, from: data)

                    if let response = response {
                        completion(.success(response))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }

            }.resume()
        }
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
