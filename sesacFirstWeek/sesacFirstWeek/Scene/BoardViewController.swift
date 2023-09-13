//
//  BoardViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet var boardTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var testLabel: [UILabel]!
    
    @IBAction func checkButtonClicked(_ sender: Any) {
        resultLabel.text = boardTextField.text
        boardTextField.text?.removeAll()
    }
    
    @IBAction func tapGestureTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designResultLabel()
        designBoardTextField()
     
        for item in testLabel {
            item.textColor = .red
            item.font = .boldSystemFont(ofSize: 15)
        }
    }
    
    func designResultLabel() {
        resultLabel.textAlignment = .center
        resultLabel.text = "안녕하세요"
        resultLabel.font = .boldSystemFont(ofSize: 20)
        resultLabel.textColor = .purple
        resultLabel.numberOfLines = 3
    }
    
    func designBoardTextField() {
        boardTextField.placeholder = "내용을 입력해주세요"
        boardTextField.textColor = .brown
        boardTextField.keyboardType = .emailAddress
        boardTextField.borderStyle = .line
        
    }
    
  
}

