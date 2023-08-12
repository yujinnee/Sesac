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
                let items = json["results"].arrayValue
                for item in items{
                    let id = item["id"].intValue
                    let title = item["title"].stringValue
                    let overview = item["overview"].stringValue
                    let releaseDate = item["release_date"].stringValue
                    let genre = item["media_type"].stringValue
                    let imageURL = item["backdrop_path"].stringValue
                    videoArray.append(Video(id: id, title: title, releaseDate: releaseDate, genre: genre, overview: overview, imageURL: imageURL))
                }
                
                completionHandler(videoArray)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
