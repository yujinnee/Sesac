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
    
    
    
    func callTrendRequest(completionHandler: @escaping ([Video]) -> ()) {
        let url = Endpoint.trend.requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                
                var videoArray = [Video]()

                let items = json["results"].arrayValue

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
                    let posterPath = item["poster_path"].stringValue
                    videoArray.append(Video(id: id, title: title, releaseDate: releaseDate, genre: genre, overview: overview, imagePath: imagePath,posterPath:posterPath ))
                }
                completionHandler(videoArray)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func callDetailRequest(id:Int,completionHandler: @escaping ([People]) -> ()) {
        let maximumPeopleCount = 10
        let url = Endpoint.credit(id).requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)

                var peopleArray = [People]()
                let items = json["cast"].arrayValue

                for i in 0..<items.count{
                    if(i>=maximumPeopleCount){break}
                    var item = items[i]
                    let id = item["id"].intValue
                    let name = item["name"].stringValue
                    let profilePath = item["profile_path"].stringValue
                    let character = item["character"].stringValue
                    peopleArray.append(People(id: id, name: name, character: character, profilePath: profilePath))
                }

                completionHandler(peopleArray)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
