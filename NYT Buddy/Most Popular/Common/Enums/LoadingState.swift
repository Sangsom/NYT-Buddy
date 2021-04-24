//
//  LoadingState.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 24/04/2021.
//

import Foundation

enum LoadingState: Equatable {
    case idle
    case loading
    case failed(NetworkError)
    case success
}
