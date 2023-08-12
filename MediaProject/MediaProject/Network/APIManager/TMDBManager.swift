//
//  TMDBManager.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

import Alamofire
import SwiftyJSON

class TMDBManager{
    
    static let shared = TMDBManager()
    
    private init() {}
    
    func callTrendRequest(type:Endpoint,completionHandler: @escaping ([Video]) -> ()) {
        let url = type.requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                
                var videoArray = [Video]()
//                print(json)
                let items = json["results"].arrayValue
//                print("====================")
//                print(items)
                for item in items{
                    let genre = item["media_type"].stringValue
                    let title: String
                    var overview = ""
                    var releaseDate = ""
                    if genre == "movie"{
                        title = item["title"].stringValue
                        overview = item["overview"].stringValue
                        releaseDate = item["release_date"].stringValue
                    }else {
                        title = item["name"].stringValue
                    }
                    let id = item["id"].intValue

                    let imagePath = item["backdrop_path"].stringValue
                    videoArray.append(Video(id: id, title: title, releaseDate: releaseDate, genre: genre, overview: overview, imagePath: imagePath))
                }
                print(videoArray)
                completionHandler(videoArray)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
