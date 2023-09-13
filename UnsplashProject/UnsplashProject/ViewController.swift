//
//  ViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var nicknameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let value = "nickname_result".localized
        //        resultLabel.text = String(format: value, "고래밥", "다마고치")
                
                nicknameTextField.placeholder = "nickname_placeholder".localized
                resultLabel.text = "age_result".localized(number: 55)
    }


}

