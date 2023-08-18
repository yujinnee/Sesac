//
//  People.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/13.
//

import Foundation

struct People{
    var id: Int
    var name: String
    var character: String
    var profilePath: String
    var profileURL: String{
        return "https://image.tmdb.org/t/p/original/"+profilePath
    }
}


// MARK: - Welcome
struct Credit: Codable {
    let crew: [Cast]
    let id: Int
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let originalName: String
    let popularity: Double
    let name: String
    let profilePath: String?
    let adult: Bool
    let id: Int
    let castID: Int?
    let knownForDepartment: Department
    let character: String?
    let gender: Int
    let order: Int?
    let creditID: String
    let job: String?
    let department: Department?

    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case popularity, name
        case profilePath = "profile_path"
        case adult, id
        case castID = "cast_id"
        case knownForDepartment = "known_for_department"
        case character, gender, order
        case creditID = "credit_id"
        case job, department
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
