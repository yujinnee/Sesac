//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = "편집 화면"
}

class AddViewController: UIViewController, UITextViewDelegate{
    
    var type: TransitionType = .add
    var contents = ""

    @IBOutlet var contentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsTextView.delegate = self
        
        
        contentsTextView.text = contents
        title = type.rawValue
         
        switch type {
        case .add:
//            title = "추가 화면"
            let xmark = UIImage(systemName: "xmark")
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .red
            
        case .edit:
//            title = "수정 화면"
            print("수정화면")
        }
        
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count)글자"
    }
    
    @objc func closeButtonClicked() {
        dismiss(animated: true)
      
    }

    
    
    

}

