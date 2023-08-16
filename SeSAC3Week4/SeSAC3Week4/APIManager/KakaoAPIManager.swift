//
//  KakaoAPIManager.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/11.
//

import Foundation

import Alamofire

class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    
    private init() {}
    
    let header: HTTPHeaders = ["Authorization": APIKey.videoKey]
    
    func callRequest(type: Endpoint,query: String,  completionHandler: @escaping ([Video],Bool) -> () ) {
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = type.requestURL + text
        
        AF.request(url, method: .get,headers:  header).validate(statusCode: 200...500).responseDecodable(of:KakaoVideo.self) { response in
            switch response.result {
            case .success(let value):
                guard let data = response.value else {return}
                
                let isEnd = data.meta.isEnd
                var videoArray = [Video]()
                let items = data.documents
                
                for item in items{
                    let author = item.author
                    let date = item.datetime
                    let time = item.playTime
                    let thumbnail = item.thumbnail
                    let title = item.title
                    let link = item.url
                    
                    let video = Video(author: author, date: date, time: time, thumbnail: thumbnail, title: title, link: link)
                    
                    videoArray.append(video)
  
                }

                completionHandler(videoArray,isEnd)
            case .failure(let error):
                print(error)
            }
        }
    }
}

