//
//  TipView.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/5/23.
//

import SwiftUI
import Combine

struct TipView: View {
    @AppStorage("wallet") var wallet: Wallet = .system

    var person: Person
    @Binding var showTipSheet: Bool

    @State var amount: String = "1,000"
    @State var comment: String = "Thanks for being awesome at Culture Shock!"

    var body: some View {
        Form {
            Section("Amount (sats)", content: {
                TextField("Amount (sats)", text: $amount)
                    .keyboardType(.numberPad)
                    .onReceive(Just(amount)) { newValue in
                        if let parsed = filterOnlyNumbers(newValue) {
                            self.amount = parsed.formatted()
                        } else {
                            self.amount = ""
                        }
                    }
            })

            Section("Comment (optional)", content: {
                TextField("Comment (optional)", text: $comment)
            })

            Button("Tip \(person.name) ⚡️") {
                if let lnUrl = person.lnUrl {
                    sendTip(lnUrl)
                }
            }
            .disabled(amount.isEmpty || amount == "0")
        }
    }

    func filterOnlyNumbers(_ value: String) -> Int? {
        let filtered = value.filter {
            $0.isNumber
        }

        if filtered.isEmpty {
            return nil
        }

        guard let amt = NumberFormatter().number(from: filtered) as? Int else {
            return nil
        }

        return amt
    }

    private func sendTip(_ lnUrl: String) {
        Task { @MainActor in
            if let amountInt = filterOnlyNumbers(amount), amountInt > 0, let payRequest = await person.fetchStaticPayRequest(lnUrl), let bolt11Invoice = await person.fetchBolt11Invoice(payRequest, amount: amountInt * 1000, comment: comment) {
                openWithWallet(bolt11Invoice)
                showTipSheet = false
            }
        }
    }

    private func openWithWallet(_ invoice: String) {
        if let url = URL(string: "\(wallet.model.link)\(invoice)") {
            UIApplication.shared.open(url)
        }
    }
}

struct TipView_Previews: PreviewProvider {
    @State static var showTipSheet: Bool = false

    static var previews: some View {
        TipView(person: ConferenceView_Previews.tyiu, showTipSheet: $showTipSheet)
    }
}
