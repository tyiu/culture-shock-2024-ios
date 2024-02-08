//
//  TryNostrView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/8/23.
//

import SwiftUI

struct TryNostrView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("This list of Nostr iOS clients is not comprehensive and the order is randomized to not give any one client preferential treatment.")
                    .padding(.bottom, 20)

                ForEach(NostrClient.allCases.shuffled()) { nostrClient in
                    Image(nostrClient.model.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)

                    if let url = URL(string: nostrClient.model.link) {
                        Link(nostrClient.model.displayName, destination: url)
                            .buttonStyle(.bordered)
                    } else {
                        Text(nostrClient.model.displayName)
                    }

                    Text(nostrClient.model.description)
                        .padding(.bottom, 10)
                }
            }
            .padding(20)
        }
        .navigationTitle("Try Nostr!")
    }
}

#Preview {
    TryNostrView()
}
