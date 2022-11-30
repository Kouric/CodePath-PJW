//
//  Artist.swift
//  Spotifly
//
//  Created by David Barcenas on 11/30/22.
//

import Foundation

struct ArtistItem: Codable {
    let items: [Artist]
}

struct Artist: Codable {
    var externalUrls: ExternalURL?
    var followers: Follower?
    var genres: [String]?
    var images: [Images]?
    let name: String
}

struct Follower: Codable {
    let total: Int
}

struct Images: Codable {
    let height: Int
    let url: String
    let width: Int
}

struct ExternalURL: Codable {
    let spotify: String
}
