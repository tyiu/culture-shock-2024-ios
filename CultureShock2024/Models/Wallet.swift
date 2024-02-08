//
//  Wallet.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/4/23.
//
//  Copied and altered from Damus:
//  https://github.com/damus-io/damus/blob/cc385d3c3ff51ae68c3cd91772cc7129858c0b81/damus/Models/Wallet.swift
//

import Foundation

enum Wallet: String, CaseIterable, Identifiable {
    var id: Self { self }

    struct Model: Identifiable, Hashable {
        var id: String { self.tag }
        var tag: String
        var displayName: String
        var link: String
    }

    init?(from string: String) {
        guard let wallet = Wallet(rawValue: string) else {
            return nil
        }
        self = wallet
    }

    case system
    case bitcoinBeach
    case blixtWallet
    case blueWallet
    case breez
    case cashApp
    case lnLink
    case muun
    case phoenix
    case river
    case strike
    case walletOfSatoshi
    case zbd
    case zeus

    var model: Model {
        switch self {
        case .system:
            return .init(tag: "system", displayName: "System default", link: "lightning:")
        case .bitcoinBeach:
            return .init(tag: "bitcoinBeach", displayName: "Bitcoin Beach", link: "bitcoinbeach:")
        case .blixtWallet:
            return .init(tag: "blixtWallet", displayName: "Blixt Wallet", link: "blixtwallet:lightning:")
        case .blueWallet:
            return .init(tag: "bluewallet", displayName: "Blue Wallet", link: "bluewallet:lightning:")
        case .breez:
            return .init(tag: "breez", displayName: "Breez", link: "breez:")
        case .cashApp:
            return .init(tag: "cashapp", displayName: "Cash App", link: "https://cash.app/launch/lightning/")
        case .lnLink:
            return .init(tag: "lnlink", displayName: "LNLink", link: "lnlink:lightning:")
        case .muun:
            return .init(tag: "muun", displayName: "Muun", link: "muun:")
        case .phoenix:
            return .init(tag: "phoenix", displayName: "Phoenix", link: "phoenix://")
        case .river:
            return .init(tag: "river", displayName: "River", link: "river://")
        case .strike:
            return .init(tag: "strike", displayName: "Strike", link: "strike:")
        case .walletOfSatoshi:
            return .init(tag: "walletofsatoshi", displayName: "Wallet of Satoshi", link: "walletofsatoshi:lightning:")
        case .zbd:
            return .init(tag: "zbd", displayName: "ZBD", link: "zebedee:lightning:")
        case .zeus:
            return .init(tag: "zeus", displayName: "Zeus", link: "zeusln:lightning:")
        }
    }
}
