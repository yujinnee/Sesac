//
//  TranslationViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/07.
//

import UIKit

import Alamofire
import SwiftyJSON

class TranslationViewController: UIViewController {
    
    
    @IBOutlet var originalTextView: UITextView!
    @IBOutlet var requestButton: UIButton!
    @IBOutlet var translateTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTextView.text = ""
        translateTextView.text = ""
        translateTextView.isEditable = false
    }
    
    @IBAction func requestButtonClicked(_ sender: Any) {
        let detectionUrl = "https://openapi.naver.com/v1/papago/detectLangs"
        
        let translationUrl = "https://openapi.naver.com/v1/papago/n2mt"
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.naverClientId,
            "X-Naver-Client-Secret": APIKey.naverClientSecret
        ]
        
        let detectionParameter: Parameters = [
            "query": originalTextView.text ?? ""
        ]
        
        AF.request(detectionUrl,method:.post,parameters:detectionParameter,headers: header).validate().responseJSON{ response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON:\(json)")
                
                let langCode = json["langCode"].stringValue

                let translationParameters: Parameters = [
                    "source": "\(langCode)",
                    "target": "en",
                    "text": self.originalTextView.text ?? ""
                ]
                
                AF.request(translationUrl, method: .post,parameters: translationParameters ,headers: header).validate().responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        print("JSON: \(json)")
                        
                        let data = json["message"]["result"]["translatedText"].stringValue
                        self.translateTextView.text = data
                        
                    case .failure(let error):
                        print("번역 오류")
                        print(error)
                    }
                }

                
            case .failure(let error):
                print("언어감지 오류")
                print(error)
            }
            
            
        }
        
       
    }
    
    
}
 
