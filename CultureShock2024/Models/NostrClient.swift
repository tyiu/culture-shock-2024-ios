//
//  NostrClient.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/8/23.
//

import Foundation

enum NostrClient: String, CaseIterable, Identifiable {
    var id: Self { self }

    struct Model: Identifiable, Hashable {
        var id: String { self.tag }
        var tag: String
        var displayName: String
        var description: String
        var link: String
    }

    init?(from string: String) {
        guard let nostrClient = NostrClient(rawValue: string) else {
            return nil
        }
        self = nostrClient
    }

    case current
    case damus
    case nos
    case nostur
    case plebstr
    case primal

    var model: Model {
        switch self {
        case .current:
            return .init(tag: "current", displayName: "Current", description: "A client that comes with a built-in Bitcoin wallet.", link: "https://app.getcurrent.io/")
        case .damus:
            return .init(tag: "damus", displayName: "Damus", description: "The first Nostr client to be banned in China.", link: "https://damus.io/")
        case .nos:
            return .init(tag: "nos", displayName: "Nos", description: "a beautiful and safe client for non-bitcoiners.", link: "https://nos.social/")
        case .nostur:
            return .init(tag: "nostur", displayName: "Nostur", description: "A feature-complete client.", link: "https://nostur.com/")
        case .plebstr:
            return .init(tag: "plebstr", displayName: "Plebstr", description: "A closed-source client that is beautiful, fast and smooth.", link: "https://plebstr.com/")
        case .primal:
            return .init(tag: "primal", displayName: "Primal", description: "A very fast client that relies on server-side caching.", link: "https://primal.net/downloads")
        }
    }
}
