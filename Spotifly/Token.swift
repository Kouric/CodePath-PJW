//
//  Token.swift
//  Spotifly
//
//  Created by David Barcenas on 11/30/22.
//

import Foundation

struct Token: Codable {
    var accessToken: String?
    var refreshToken: String?
    var error: String?
    var errorDescription: String?
}
