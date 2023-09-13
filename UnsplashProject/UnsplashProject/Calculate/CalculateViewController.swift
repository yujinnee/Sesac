//
//  CalculateViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController {
    
    let viewModel = CalculateViewModel()

    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    @objc func firstTextFieldChanged(){
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
    }
    @objc func secondTextFieldChanged(){
        viewModel.secondNumber.value = secondTextField.text
        viewModel.calculate()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
      
        
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
        }
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
        }
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        
        }
        
    
        firstTextField.text = viewModel.firstNumber.value
        secondTextField.text = viewModel.secondNumber.value

      
        //
        //        let person = Person("새싹이")
        //
        //        person.name = "카스타드"
        //
        //        person.name = "칙촉"
        //
        //        person.introduce { value in
        //            self.resultLabel.text = value
        //            self.view.backgroundColor = [UIColor.orange, UIColor.lightGray, UIColor.magenta].randomElement()!
        //
        //        }
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //            person.name = "바나나"
        //        }
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        //            person.name = "키위"
        //        }
        //
    }
    


}
