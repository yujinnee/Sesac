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
