//
//  HelpView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/8/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ScrollView {
            Text("Nostr is a simple, open protocol that enables truly censorship-resistant and global value-for-value publishing on the web.")
                .padding(.bottom, 20)

            if let url = URL(string: "https://nostr.com/") {
                Link("Visit Nostr.com to learn more!", destination: url)
                    .buttonStyle(.bordered)
                    .padding(.bottom, 20)
            }

            Text("What is Nostr?")
                .bold()
                .padding(.bottom, 10)

            Text(
"""
Nostr stands for “Notes and Other Stuff Transmitted by Relays”. Like HTTP or TCP-IP, Nostr is a protocol; an open standard upon which anyone can build. Nostr itself is not an app or service that you sign up for.

Nostr is designed for simplicity and enables censorship-resistant and globally decentralized publishing on the web. Let’s unpack that a little:
"""
            )
            .padding(.bottom, 20)

            Text("Simple")
                .bold()
                .padding(.bottom, 10)

            Text("The protocol is based on very simple & flexible Event objects (which are passed around as plain JSON) and uses standard public-key cryptography for keys & signing. This makes it easy to run relays and build clients and ensures that the protocol can be extended over time.")
                .padding(.bottom, 20)

            Text("Resilient")
                .bold()
                .padding(.bottom, 10)

            Text("Because Nostr doesn’t rely on a small number of trusted servers for moving or storing data, it’s very resilient. The protocol assumes that relays will disappear and allows users to connect & publish to an arbitrary number of relays that they can change over time.")
                .padding(.bottom, 20)

            Text("Verifiable")
                .bold()
                .padding(.bottom, 10)

            Text("Because Nostr accounts are based on public-key cryptography it’s easy to verify messages were really sent by the user in question.")
                .padding(.bottom, 20)
        }
        .padding(20)
        .navigationTitle("What is Nostr?")
    }
}

#Preview {
    HelpView()
}
