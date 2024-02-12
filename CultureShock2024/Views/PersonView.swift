//
//  PersonView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/10/23.
//

import SwiftUI

struct PersonView: View {
    @State var satsString: String = "1000"
    @State var comment: String = "Thanks for providing value at Culture Shock!"
    @State var showTipSheet: Bool = false
    @AppStorage("wallet") var wallet: Wallet = .system

    let person: Person

    var nostrProfileUrl: URL? {
        if let nostrUrl = URL(string: "nostr:\(person.nostrPublicKey)"), UIApplication.shared.canOpenURL(nostrUrl) {
            return nostrUrl
        }
        if let njumpUrl = URL(string: "https://njump.me/\(person.nostrPublicKey)"), UIApplication.shared.canOpenURL(njumpUrl) {
            return njumpUrl
        }
        return nil
    }

    var walletToDownload: Wallet.Model? {
        if wallet == .system {
            guard let randomWalletToDownload = Wallet.allModels.dropFirst().randomElement() else {
                return nil
            }
            return randomWalletToDownload
        }

        return wallet.model
    }

    var body: some View {
        ScrollView {
            Text(person.name)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            if let description = person.description {
                Text(description)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }

            if person.nostrPublicKey.starts(with: "npub1") {
                if let nostrProfileUrl {
                    Link("Nostr Profile", destination: nostrProfileUrl)
                        .buttonStyle(.bordered)
                        .contextMenu {
                            Button {
                                UIPasteboard.general.string = person.nostrPublicKey
                            } label: {
                                Text("Copy Nostr public key", comment: "Context menu option for copying a user's Nostr public key.")
                            }
                        }
                }
            }

            if let lightningIdentifier = person.lightningIdentifier, person.lnUrl != nil {
                if let walletUrl = URL(string: wallet.model.link), UIApplication.shared.canOpenURL(walletUrl) {
                    Button("⚡️ Tip with Lightning") {
                        showTipSheet = true
                    }
                    .buttonStyle(.bordered)
                    .contextMenu {
                        Button {
                            UIPasteboard.general.string = person.lightningIdentifier
                        } label: {
                            Label(lightningIdentifier, systemImage: "doc.on.doc")
                        }
                    }
                } else if let walletToDownload, let appStoreLink = walletToDownload.appStoreLink, let appStoreUrl = URL(string: appStoreLink) {
                    Link("⚡️ Install \(walletToDownload.displayName) to tip", destination: appStoreUrl)
                        .buttonStyle(.bordered)
                        .contextMenu {
                            Button {
                                UIPasteboard.general.string = person.lightningIdentifier
                            } label: {
                                Label(lightningIdentifier, systemImage: "doc.on.doc")
                            }
                        }
                }
            }

            if let picture = person.picture, !picture.isEmpty {
                Image(picture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
            }
        }
        .padding(10)
        .sheet(isPresented: $showTipSheet, onDismiss: { showTipSheet = false }, content: {
            TipView(person: person, showTipSheet: $showTipSheet)
        })
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: ConferenceView_Previews.tyiu)
    }
}
