//
//  SeSACAPI.swift
//  Week10
//`
//  Created by 이유진 on 2023/09/19.
//

import Foundation
import Alamofire

enum SeSACAPI {
    private static let key = APIKeys.unsplashKey
    
    case search(query: String)
    case random
    case photo(id: String) //연관값, associated value
    
    private var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var endpoint: URL {
        switch self {
        case .search:
            return URL(string: baseURL + "search/photos")!
        case .random:
            return URL(string: baseURL + "photos/random")!
        case .photo(let id):
            return URL(string: baseURL + "photos/\(id)")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(SeSACAPI.key)"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: [String: String] {
        switch self {
        case .search(let query):
            return ["query":query]
        case .random, .photo: return ["":""]
       
        }
    }
}
