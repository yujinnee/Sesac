//
//  Video.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

struct Video: Codable{
    var id: Int
    var title: String
    var releaseDate: String
    var genre: String
    var overview: String
    var imagePath: String
    var imageURL: String {
        return "https://image.tmdb.org/t/p/original/"+imagePath
        //        return "https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
    }
    var posterPath: String
    var posterURL: String{
        return "https://image.tmdb.org/t/p/original/"+posterPath
    }
    
}

// MARK: - Trend
struct Trend: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let originalLanguage: OriginalLanguage
    let originalTitle, releaseDate: String?
    let posterPath, overview: String
    let voteCount: Int
    let genreIDS: [Int]
    let popularity: Double
    let id: Int
    let adult: Bool
    let title: String?
    let mediaType: MediaType
    let voteAverage: Double
    let backdropPath: String
    let video: Bool?
    let originalName, firstAirDate, name: String?
    let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        case voteCount = "vote_count"
        case genreIDS = "genre_ids"
        case popularity, id, adult, title
        case mediaType = "media_type"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case video
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case name
        case originCountry = "origin_country"
    }

}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
    case ja = "ja"
}






