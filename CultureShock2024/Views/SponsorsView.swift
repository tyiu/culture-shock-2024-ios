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
                                .background(.black)
                        }
                        Link(sponsor.name, destination: sponsor.url)
                    }
                }
            }
        }
    }
}

struct SponsorsView_Previews: PreviewProvider {
    static var previews: some View {
        SponsorsView(sponsors: ConferenceView_Previews.sponsors)
    }
}
