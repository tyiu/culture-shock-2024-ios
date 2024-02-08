//
//  LNUrlPay.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 11/4/23.
//
//  swiftlint:disable all

import Foundation

struct LNUrlPayRequest: Decodable {
    let commentAllowed: Int?
    let callback: String?
}

struct LNUrlPayResponse: Decodable {
    let pr: String
}

//  swiftlint:enable all
