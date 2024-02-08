//
//  SponsorsView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 2/8/24.
//

import SwiftUI

struct SponsorsView: View {
    let sponsors: [Sponsor]

    var body: some View {
        VStack {
            List {
                ForEach(sponsors, id: \.self) { sponsor in
                    HStack {
                        if let picture = sponsor.picture, !picture.isEmpty {
                            Image(picture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                        }
                        Link(sponsor.name, destination: sponsor.url)
                    }
                }
            }
        }
    }
}

struct SponsorsView_Previews: PreviewProvider {
    static let sponsors = [
        Sponsor(name: "Wavlake", picture: "wavlake", url: URL(string: "https://wavlake.com/")!),
        Sponsor(name: "ZBD", picture: "zbd", url: URL(string: "https://zbd.gg/")!),
        Sponsor(name: "emeralize", picture: "emeralize", url: URL(string: "https://emeralize.app/")!),
        Sponsor(name: "Plebchain Radio", picture: "plebchain-radio", url: URL(string: "https://fountain.fm/show/0N6GGdZuYNNG7ysagCg9")!),
        Sponsor(name: "Lightning Store", picture: "lightning-store", url: URL(string: "https://lightning.store/")!),
        Sponsor(name: "Hello Lincoln", picture: "hello-lincoln", url: URL(string: "https://850wlincoln.com/")!)
    ]

    static var previews: some View {
        SponsorsView(sponsors: sponsors)
    }
}
