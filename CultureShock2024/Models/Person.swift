//
//  Person.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 5/10/23.
//  Lightning URL code partially copied and altered from Damus: https://github.com/damus-io/damus/blob/cc385d3c3ff51ae68c3cd91772cc7129858c0b81/damus/Nostr/Nostr.swift
//

import Foundation

struct Person: Identifiable, Hashable {
    var id: String { self.nostrPublicKey }
    let nostrPublicKey: String
    let name: String
    let description: String?
    let picture: String?
    let lightningIdentifier: String?
    let lnUrl: String?

    init(nostrPublicKey: String, name: String, description: String?, picture: String?, lightningIdentifier: String?) {
        self.nostrPublicKey = nostrPublicKey
        self.name = name
        self.description = description
        self.picture = picture
        self.lightningIdentifier = lightningIdentifier

        if let lightningIdentifier {
            if lightningIdentifier.lowercased().hasPrefix("lnurl") {
                self.lnUrl = lightningIdentifier
            } else if lightningIdentifier.contains("@") {
                let parts = lightningIdentifier.split(separator: "@")
                guard parts.count == 2 else {
                    self.lnUrl = nil
                    return
                }

                let url = "https://\(parts[1])/.well-known/lnurlp/\(parts[0])"
                guard let data = url.data(using: .utf8) else {
                    self.lnUrl = nil
                    return
                }

                self.lnUrl = Bech32.encode("lnurl", baseEightData: data)
            } else {
                self.lnUrl = nil
            }
        } else {
            self.lnUrl = nil
        }
    }

    func fetchStaticPayRequest(_ lnUrl: String) async -> LNUrlPayRequest? {
        print("fetching static payreq \(lnUrl)")

        guard let url = decodeLnUrl(lnUrl) else {
            return nil
        }

        guard let ret = try? await URLSession.shared.data(from: url) else {
            return nil
        }

        let json = String(decoding: ret.0, as: UTF8.self)

        guard let payRequest: LNUrlPayRequest = decodeJson(json) else {
            return nil
        }

        return payRequest
    }

    func decodeLnUrl(_ lnUrl: String) -> URL? {
        guard let decoded = try? Bech32.decode(lnUrl) else {
            return nil
        }
        guard decoded.hrp == "lnurl" else {
            return nil
        }
        guard let data = decoded.checksum.base8FromBase5 else {
            return nil
        }
        guard let url = URL(string: String(decoding: data, as: UTF8.self)) else {
            return nil
        }
        return url
    }

    func fetchBolt11Invoice(_ payRequest: LNUrlPayRequest, amount: Int, comment: String?) async -> String? {
        guard var baseUrl = payRequest.callback.flatMap({ URLComponents(string: $0) }) else {
            return nil
        }

        var query = [URLQueryItem(name: "amount", value: "\(amount)")]

        // add a lud12 comment as well if we have it
        if let comment, let limit = payRequest.commentAllowed, limit != 0 {
            let limitedComment = String(comment.prefix(limit))
            query.append(URLQueryItem(name: "comment", value: limitedComment))
        }

        baseUrl.queryItems = query

        guard let url = baseUrl.url else {
            return nil
        }

        var ret: (Data, URLResponse)?
        do {
            ret = try await URLSession.shared.data(from: url)
        } catch {
            print(error.localizedDescription)
            return nil
        }

        guard let ret else {
            return nil
        }

        let jsonString = String(decoding: ret.0, as: UTF8.self)
        guard let result: LNUrlPayResponse = decodeJson(jsonString) else {
            print("fetchZapInvoice error: \(jsonString)")
            return nil
        }

        return result.pr
    }

    func decodeJson<T: Decodable>(_ val: String) -> T? {
        return try? JSONDecoder().decode(T.self, from: Data(val.utf8))
    }
}
