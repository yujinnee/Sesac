//
//  VideoViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class VideoViewController: UIViewController {
    
    var videoList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        callRequest()
    }
    

    func callRequest(){
        let url = "https://dapi.kakao.com/v2/search/vclip?query=NewJeans"
        let header: HTTPHeaders = ["Authorization": "KakaoAK 868aedc703e71db462ffa16a8a48f902"]
        
        AF.request(url, method: .get,headers:  header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["documents"].arrayValue{
                    let title = item["title"].stringValue
                    self.videoList.append(title)
                }
                        
            case .failure(let error):
                print(error)
            }
        }
    }

}
