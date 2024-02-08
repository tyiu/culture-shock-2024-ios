//
//  SettingsView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/4/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("wallet") var selectedWallet: Wallet = .system

    var body: some View {
        Form {
            Section(
                content: {
                    Picker("Lightning Wallet", selection: $selectedWallet) {
                        ForEach(Wallet.allCases) { wallet in
                            Text(wallet.model.displayName)
                        }
                    }
                },
                header: {
                    Text("Lightning Wallet")
                }
            )
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
