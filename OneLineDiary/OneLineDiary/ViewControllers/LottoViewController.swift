//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var list = ["영화","드라마","SF","애니메이션"]
    let pickerView = UIPickerView()
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select \(row)")
        textField.text = list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
}
