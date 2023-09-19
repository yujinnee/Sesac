//
//  APIRouter.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerError: Int, Error, LocalizedError {
    case unauthorized = 401
    case permissiondenied = 403
    case invalidServer = 500
    case missingParameter = 400
    
    var errorDescription: String {
        switch self {
        case .unauthorized:
            return "인증 정보가 없습니다"
        case .permissiondenied:
            return "권한이 없습니다"
        case .invalidServer:
            return "서버 점검 중입니다"
        case .missingParameter:
            return "검색어를 입력해주세요"
        }
    }
}

enum APIRouter {
    
    case beers
    case singleBeer(id: String)
    case randomBeer
    
    private var baseURL: String {
        return "https://api.punkapi.com/v2/"
    }
    
    var endpoint: URL {
        switch self {
        case .beers:
            return URL(string: baseURL + "beers")!
        case .singleBeer(let id):
            return URL(string: baseURL + "beers/\(id)")!
        case .randomBeer:
            return URL(string: baseURL + "beers/random")!
        }
    }
//
//    var header: HTTPHeaders {
//        return ["": ""]
//    }

    var method: HTTPMethod {
        return .get
    }
//    
//    var query: [String: String] {
//        switch self {
//        case .singleBeer(let id):
//            return ["query":id]
//        case .beers,.randomBeer:
//            return ["":""]
//        }
//    }
}

