//
//  MediaView.swift
//  NYT Buddy
//
//  Created by Rinalds Domanovs on 26/04/2021.
//

import SwiftUI

struct MediaView: View {
    var media: [Media]

    var body: some View {
        VStack(alignment: .leading) {
            Divider()

            ScrollView(.vertical, showsIndicators: true, content: {
                ForEach(media, id: \.self) {  mediaItem in
                    VStack {
                        Text(mediaItem.caption)
                        RemoteImage(url: mediaItem.mediaMetadata.last!.url.absoluteString)
                        HStack {
                            Spacer()
                            Text(mediaItem.copyright)
                                .foregroundColor(.secondary)
                        }
                    }
                    .multilineTextAlignment(.center)
                }
            })
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(media: [Media.exampleData])
            .previewLayout(.sizeThatFits)
    }
}
