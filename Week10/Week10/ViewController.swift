//
//  ViewController.swift
//  Week10
//
//  Created by 이유진 on 2023/09/19.
//

import UIKit

import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        NetworkBasic.shared.random { photo, error in
//            guard let photo = photo else { return }
//            guard let error = error else { return }
//        }
        Network.shared.request(type: Photo.self, api: .photo(id: "0rvKw0fDiHk")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
                
            }
        }
    
        
        Network.shared.request(type: Photo.self, api: .search(query: "apple")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
                
            }
        }
//        
        NetworkBasic.shared.detailPhoto(id: "") { response in
            switch response {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
   
 
}


struct Photo: Decodable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Decodable {
    let id: String
    let created_at: String
    let urls: PhotoURL
}

struct PhotoURL: Decodable {
    let full: String
    let thumb: String
}
