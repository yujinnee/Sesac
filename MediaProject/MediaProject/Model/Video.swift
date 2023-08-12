//
//  Video.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

struct Video{
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
    
    
}
