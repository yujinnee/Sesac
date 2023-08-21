//
//  TMDBManager.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import Foundation

import Alamofire

class TMDBManager{
    
    static let shared = TMDBManager()
    
    private init() {}
    
    
    
    func callTrendRequest(completionHandler: @escaping ([Video]) -> ()) {
        let url = Endpoint.trend.requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseDecodable(of:Trend.self){ response in
            
            switch response.result{
            case .success(let value):
                guard let data = response.value else {return}
                var videoArray = [Video]()
                let items = data.results
                
                for item in items{
                    let genre = item.mediaType
                    let title: String
                    var overview = ""
                    var releaseDate = ""
                    switch genre{
                    case .movie:
                        title = item.title ?? ""
                        overview = item.overview
                        releaseDate = item.releaseDate ?? ""
                    case .tv:
                        title = item.name ?? ""
                    }
                    let id = item.id
                    let imagePath = item.backdropPath
                    let posterPath = item.posterPath
                    videoArray.append(Video(id: id, title: title, releaseDate: releaseDate, genre: genre.rawValue, overview: overview, imagePath: imagePath,posterPath:posterPath ))
                }
                completionHandler(videoArray)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
        func callDetailRequest(id:Int,completionHandler: @escaping ([People]) -> ()) {
            let url = Endpoint.credit(id).requestURL
            AF.request(url,method: .get).validate(statusCode: 200...500).responseDecodable(of:Credit.self){ response in
                switch response.result{
                case .success(let value):
                    guard let data = response.value else {return}
                  
                    var peopleArray = [People]()
                    let items = data.cast
    
                    for item in items{
                        let id = item.id
                        let name = item.name
                        let profilePath = item.profilePath
                        let character = item.character
                        peopleArray.append(People(id: id, name: name, character: character ?? "", profilePath: profilePath ?? ""))
                    }
    
                    completionHandler(peopleArray)
                case .failure(let error):
                    print(error)
                }
    
            }
        }
    
    func callSimilarRequest(id:Int,completionHandler: @escaping ([SimilarVideo]) -> ()) {
        let url = Endpoint.similar(id).requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseDecodable(of:Similar.self){ response in
            switch response.result{
            case .success(let value):
                guard let data = response.value else {return}

                completionHandler(data.results)
            case .failure(let error):
                print(error)
            }

        }
    }
    
    func callVideosRequest(id:Int,completionHandler: @escaping ([VideosVideo]) -> ()) {
        let url = Endpoint.video(id).requestURL
        AF.request(url,method: .get).validate(statusCode: 200...500).responseDecodable(of:Videos.self){ response in
            print(response)
            switch response.result{
            case .success(let value):
                guard let data = response.value else {return}

                completionHandler(data.results)
            case .failure(let error):
                print(error)

            }

        }
    }
    
}
