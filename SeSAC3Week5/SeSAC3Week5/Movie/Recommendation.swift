//
//  Recommendation.swift
//  SeSAC3Week5
//
//  Created by 이유진 on 2023/08/17.
//

import Foundation

// MARK: - Welcome
struct Recommendation: Codable {
    let totalPages, page, totalResults: Int
    let results: [RecommendationResult]

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case page
        case totalResults = "total_results"
        case results
    }
}

// MARK: - Result
struct RecommendationResult: Codable {
    let popularity: Double
    let title: String
    let posterPath: String?
    let overview: String
    let adult: Bool
    let voteAverage: Double
    let voteCount, id: Int
    let releaseDate: String
    let video: Bool
    let originalTitle: String
    let originalLanguage: String
    let mediaType: MediaType
    let backdropPath: String?
    let genreIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case popularity, title
        case posterPath = "poster_path"
        case overview, adult
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case id
        case releaseDate = "release_date"
        case video
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case mediaType = "media_type"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case it = "it"
//    case no = "no"
//    case pl = "pl"
//}
