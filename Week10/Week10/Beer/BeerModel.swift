//
//  BeerModel.swift
//  Week10
//
//  Created by 이유진 on 2023/09/20.
//

import Foundation

struct Beer: Decodable {
    let id: Int
    let name: String
    let imageURL: String


    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
       
    }
}

typealias Beers = [Beer]
