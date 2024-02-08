//
//  Sponsor.swift
//  CultureShock2024
//
//  Created by Terry Yiu on 2/8/24.
//

import Foundation

struct Sponsor: Identifiable, Hashable {
    var id: String { self.name }
    let name: String
    let picture: String?
    let url: URL

    init(name: String, picture: String?, url: URL) {
        self.name = name
        self.picture = picture
        self.url = url
    }
}
