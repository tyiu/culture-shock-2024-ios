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
        let tag: String
        let displayName: String
        let link: String
        let appStoreLink: String?
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
            return .init(tag: "system", displayName: "System default", link: "lightning:", appStoreLink: nil)
        case .bitcoinBeach:
            return .init(tag: "bitcoinBeach", displayName: "Bitcoin Beach", link: "bitcoinbeach:", appStoreLink: "https://apps.apple.com/app/blink-bitcoin-beach-wallet/id1531383905")
        case .blixtWallet:
            return .init(tag: "blixtWallet", displayName: "Blixt Wallet", link: "blixtwallet:lightning:", appStoreLink: "https://testflight.apple.com/join/EXvGhRzS")
        case .blueWallet:
            return .init(tag: "bluewallet", displayName: "Blue Wallet", link: "bluewallet:lightning:", appStoreLink: "https://apps.apple.com/app/bluewallet-bitcoin-wallet/id1376878040")
        case .breez:
            return .init(tag: "breez", displayName: "Breez", link: "breez:", appStoreLink: "https://apps.apple.com/app/breez-lightning-client-pos/id1463604142")
        case .cashApp:
            return .init(tag: "cashapp", displayName: "Cash App", link: "https://cash.app/launch/lightning/", appStoreLink: "https://apps.apple.com/app/cash-app/id711923939")
        case .lnLink:
            return .init(tag: "lnlink", displayName: "LNLink", link: "lnlink:lightning:", appStoreLink: "https://testflight.apple.com/join/aNY4yuuZ")
        case .muun:
            return .init(tag: "muun", displayName: "Muun", link: "muun:", appStoreLink: "https://apps.apple.com/app/muun-wallet/id1482037683")
        case .phoenix:
            return .init(tag: "phoenix", displayName: "Phoenix", link: "phoenix://", appStoreLink: "https://apps.apple.com/app/phoenix-wallet/id1544097028")
        case .river:
            return .init(tag: "river", displayName: "River", link: "river://", appStoreLink: "https://apps.apple.com/app/river-buy-bitcoin/id1536176542")
        case .strike:
            return .init(tag: "strike", displayName: "Strike", link: "strike:", appStoreLink: "https://apps.apple.com/app/strike-btc-global-money/id1488724463")
        case .walletOfSatoshi:
            return .init(tag: "walletofsatoshi", displayName: "Wallet of Satoshi", link: "walletofsatoshi:lightning:", appStoreLink: "https://apps.apple.com/app/wallet-of-satoshi/id1438599608")
        case .zbd:
            return .init(tag: "zbd", displayName: "ZBD", link: "zebedee:lightning:", appStoreLink: "https://apps.apple.com/app/zbd-games-rewards-bitcoin/id1484394401")
        case .zeus:
            return .init(tag: "zeus", displayName: "Zeus", link: "zeusln:lightning:", appStoreLink: "https://apps.apple.com/app/zeus-wallet/id1456038895")
        }
    }

    static var allModels: [Model] {
        return Self.allCases.map { $0.model }
    }
}
