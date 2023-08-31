//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/30.
//

import Foundation

class APIService {
    
    private init() { }
    
    static let shared = APIService()
    
    func callRequest() {
        
//        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080")!
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let value = String(data:data!,encoding:  .utf8)
//            print(value)
//            
//            print(data)
//            print(response)
//            print(error)
        }.resume()
        
    }
}
