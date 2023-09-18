//
//  NumberViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/18.
//

import UIKit

class NumberViewModel {
    
    var number: Observable<String?> = Observable("1000")
    var result = Observable("1,327,000")
    
    func convertNumber() {
        //빈 값, 문자열, 백만원 내에서 가능
        guard let text = number.value else {
            result.value = "값을 입력해주세요"
            return
        }
        guard let textToNumber  = Int(text) else {
            result.value = "100만원 이하의 숫자를 입력해주세요"
            return
        }
        guard textToNumber > 0, textToNumber <= 1000000 else {
            result.value = "환전 범주는 100만원 이하입니다"
            return
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let decimalNumber = numberFormatter.string(for: textToNumber * 1327)!
        
        result.value = "환전 금액은 \(decimalNumber)입니다."
        
        
    }
    
    
    
}

class NumberViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    func bindData() {
        
        viewModel.number.bind { jack in
            self.numberTextField.text = jack
            
        }
        
        viewModel.result.bind { value in
            self.resultLabel.text = value
        }
    }
    

    @objc func numberTextFieldChanged() {
        
        viewModel.number.value = numberTextField.text
        viewModel.convertNumber()
        
       
        
    }

}
