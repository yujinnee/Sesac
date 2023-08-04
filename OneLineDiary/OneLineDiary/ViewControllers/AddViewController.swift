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
    
    let placeholderText = "내용을 입력해주세요"

    @IBOutlet var contentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsTextView.delegate = self
//        contentsTextView.text = contents
        title = type.rawValue
         
        switch type {
        case .add:
//            title = "추가 화면"
            let xmark = UIImage(systemName: "xmark")
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain , target: self , action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .red
            
            contentsTextView.text = placeholderText
            contentsTextView.textColor = .lightGray
            
        case .edit:
//            title = "수정 화면"
            print("수정화면")
            print("테스트커밋")
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {

        title = "\(textView.text.count)글자"
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    @objc func closeButtonClicked() {
        dismiss(animated: true)
      
    }

    
    
    

}

