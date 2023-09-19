//
//  NetworkBasic.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import Foundation

import Alamofire

enum SeSACError: Int, Error, LocalizedError {
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

final class NetworkBasic {
    
    static let shared = NetworkBasic()
    
    private init() { }//초기화 막기

//    func request(query: String, completion: @escaping (Photo?, Error?) -> Void) {
    func request(api: SeSACAPI,query: String, completion: @escaping (Result<Photo, SeSACError>) -> Void) {

        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString),headers: api.header).responseDecodable(of: Photo.self) { response in
            switch response.result {
            case .success(let data): completion(.success(data))
            case .failure(_):
//                completion(.failure(error))
                
//                guard let statusCode = response.response?.statusCode else {return}
                let statusCode = response.response?.statusCode ?? 500
                guard let error = SeSACError(rawValue: statusCode) else {return}
                completion(.failure(error))
            }
        }
    }
    
    func random(completion: @escaping (Result<PhotoResult,SeSACError>) -> Void) {
        let api = SeSACAPI.random
        
        AF.request(api.endpoint, method: api.method,headers: api.header).responseDecodable(of: PhotoResult.self) { response in
            switch response.result {
            case .success(let data): completion(.success(data))
            case .failure(let error):
                let statusCode = response.response?.statusCode ?? 500
                guard let error = SeSACError(rawValue: statusCode) else {return}
                completion(.failure(error))
            }
        }
    }
    
    func detailPhoto(id:String, completion: @escaping (Result<PhotoResult, SeSACError>) -> Void) {
        let api = SeSACAPI.photo(id: id)
        
        AF.request(api.endpoint, method: api.method,headers: api.header).responseDecodable(of: PhotoResult.self) { response in
            switch response.result {
            case .success(let data): completion(.success(data))
                
            case .failure(_):
                let statusCode = response.response?.statusCode ?? 500
                guard let error = SeSACError(rawValue: statusCode) else {return}
                completion(.failure(error))
            }
        }
    }
}
