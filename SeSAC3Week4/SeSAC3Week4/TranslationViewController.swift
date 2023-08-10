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
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "UW25USu_ZAk33vq1UucI",
            "X-Naver-Client-Secret": "paCIVowNVZ"
        ]
        let parameters: Parameters = [
            "source": "ko",
            "target": "en",
            "text": originalTextView.text ?? ""
        ]
        
        AF.request(url, method: .post,parameters: parameters ,headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let data = json["message"]["result"]["translatedText"].stringValue
                self.translateTextView.text = data
                
            case .failure(let error):
                print(error)
            }
        }

    }
    
    
}
 
