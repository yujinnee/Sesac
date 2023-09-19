//
//  Network.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import Foundation

import Alamofire


final class Network {
    
    static let shared = Network()
    
    private init() { }//초기화 막기

//    func request(query: String, completion: @escaping (Photo?, Error?) -> Void) {
    func request<T: Decodable>(type: T.Type,api: SeSACAPI, completion: @escaping (Result<T, SeSACError>) -> Void) {

        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString),headers: api.header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                let statusCode = response.response?.statusCode ?? 500
                guard let error = SeSACError(rawValue: statusCode) else {return}
                completion(.failure(error))
            }
        }
    }
    
   
}
