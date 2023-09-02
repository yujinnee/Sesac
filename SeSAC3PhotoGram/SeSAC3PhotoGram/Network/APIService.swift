//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/30.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}
struct PhotoResult: Codable {
    let id: String
    let urls: PhotoURL
}
struct PhotoURL: Codable {
    let full: String
    let thumb: String
}
class APIService {
    
    private init() { }
    
    static let shared = APIService()
    
    func callRequest(query: String,comletionHandler: @escaping (Photo?) -> Void) {
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(APIKeys.unsplashKey)") else {return}
        let request = URLRequest(url: url, timeoutInterval: 10)

        
        URLSession.shared.dataTask(with: request) { data,response,error in
            print("FFSsf")
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                print(error)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data)
                
                comletionHandler(result)
                
                print(result)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    
/*
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
<<<<<<< Updated upstream
=======
 */
    
    func callImageRequest(word: String,comletionHandler: @escaping ([String]) -> Void) {
        let url = URL(string: "https://api.unsplash.com/search/photos?query=\(word)&client_id=\(APIKeys.unsplashKey)")!
        AF.request(url, method: .get).validate()
            .responseDecodable(of: UnsplashImageDataModel.self) { response in
                print(response)
                guard let value = response.value else { return }
                print("responseDecodable:", value)
                var imageUrls = value.results.map{$0.urls.regular}
                
                comletionHandler(imageUrls)
            }
    }
        
>>>>>>> Stashed changes
}
