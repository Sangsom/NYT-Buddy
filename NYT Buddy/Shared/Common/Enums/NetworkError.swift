//
//  NetworkError.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 24/04/2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}
