//
//  TranslationViewController.swift
//  SeSAC3Week4
//
//  Created by 이유진 on 2023/08/07.
//

import UIKit

class TranslationViewController: UIViewController {
    
    
    @IBOutlet var originalTextView: UITextView!
    @IBOutlet var requestButton: UIButton!
    @IBOutlet var translateTextView: UITextView!
    
    
//    let helper = UserDefaultsHelper()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        UserDefaults.standard.set("고래밥", forKey: "nickname")
        UserDefaults.standard.set(33,forKey:"age")
        UserDefaultsHelper.standard.nickname = "칙촉"
        UserDefaultsHelper.standard.age = 23
        
        
//        originalTextView.text = UserDefaults.standard.string(forKey: "nickname")
//        originalTextView.text = "\(UserDefaults.standard.integer(forKey: "age"))"
//        originalTextView.text = helper.standard.nickname
//        originalTextView.text = "\(helper.standard.age)"
        
        
        UserDefaultsHelper.standard.nickname = "칙촉"
        UserDefaultsHelper.standard.age = 23
        originalTextView.text = UserDefaultsHelper.standard.nickname
        originalTextView.text = "\(UserDefaultsHelper.standard.age)"
        

        
        
        
        
        originalTextView.text = ""
        translateTextView.text = ""
        translateTextView.isEditable = false
    }
    
    @IBAction func requestButtonClicked(_ sender: Any) {
      
        TranslateAPIManager.shared.callRequest(text: originalTextView.text ?? "") { result in
            self.translateTextView.text = result
        }
    }
    
    
}
 
