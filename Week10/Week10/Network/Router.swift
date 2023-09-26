//
//  Router.swift
//  Week10
//
//  Created by 이유진 on 2023/09/20.
//

import Foundation

import Alamofire

enum Router: URLRequestConvertible{
   
    
    private static let key = APIKeys.unsplashKey
    
    case search(query: String)
    case random
    case photo(id: String) //연관값, associated value
    
    private var baseURL: URL {
        return URL(string:"https://api.unsplash.com/")!
    }
    private var path: String {
        switch self {
        case .search:
            return "search/photos"
        case .random:
            return "photos/random"
        case .photo(let id):
            return "photos/\(id)"
        }
    }
    
    
    private var endpoint: String {
        switch self {
        case .search:
            return "search/photos"
        case .random:
            return "photos/random"
        case .photo(let id):
            return "photos/\(id)"
        }
    }
    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(Router.key)"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    var query: [String: String] {
        switch self {
        case .search(let query):
            return ["query": query]
        case .random, .photo:
            return ["": ""]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.headers = header
        request.method = method
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        return request
    }
    
   
}
