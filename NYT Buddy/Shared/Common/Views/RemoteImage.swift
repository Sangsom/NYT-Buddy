//
//  RemoteImage.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 26/04/2021.
//

import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    var size: CGSize?

    var body: some View {
        selectImage()
            .resizable()
            .scaledToFill()
            .frame(width: size?.width, height: size?.height)
            .clipped()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle"), size: CGSize? = nil) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
        self.size = size
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}