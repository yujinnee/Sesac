//
//  Videos.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/22.
//

import Foundation

// MARK: - Welcome
struct Videos: Codable {
    let id: Int?
    let results: [VideosVideo]
}

// MARK: - Result
struct VideosVideo: Codable {
    let iso639_1: String
    let iso3166_1: String
    let name, key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt, id: String
    var thumbnailURL: String {
        return "https://img.youtube.com/vi/\(key)/0.jpg"
    }

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}

//enum ISO3166_1: String, Codable {
//    case us = "US"
//}
//
//enum ISO639_1: String, Codable {
//    case en = "en"
//}

//enum Site: String, Codable {
//    case youTube = "YouTube"
//}
//
//enum TypeEnum: String, Codable {
//    case behindTheScenes = "Behind the Scenes"
//    case clip = "Clip"
//    case featurette = "Featurette"
//    case teaser = "Teaser"
//    case trailer = "Trailer"
//}
