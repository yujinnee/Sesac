//
//  BeerNetworkManager.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import Foundation

import Alamofire


final class BeerNetworkManager {
    
    static let shared = BeerNetworkManager()
    
    private init() { }//초기화 막기

//    func request(query: String, completion: @escaping (Photo?, Error?) -> Void) {
    func request<T: Decodable>(type: T.Type,api: APIRouter, completion: @escaping (Result<T, BeerError>) -> Void) {

        AF.request(api.endpoint, method: api.method).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                let statusCode = response.response?.statusCode ?? 500
                guard let error = BeerError(rawValue: statusCode) else {return}
                completion(.failure(error))
            }
        }
    }
    
   
}
