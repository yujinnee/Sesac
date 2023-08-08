//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var bonusNumberLabel: UILabel!
    let pickerView = UIPickerView()
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var numberLabel: UILabel!
    var list: [Int] = Array(1...1079).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        print("2")
        
        
        callRequest(num: 1079)
       
        print("4")
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        print("5")
    }
    
    func callRequest(num:Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=" + String(num)
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let date = json["drwNoDate"].stringValue
                let bonusNumber = json["bnusNo"].intValue
                var numbers = [Int]()
                for i in 1...6{
                    numbers.append(json["drwtNo\(i)"].intValue)
                }
                numbers.append(bonusNumber)

                var numberString = ""
                numbers.map{numberString.append(String($0)+" ")}
                self.dateLabel.text = date
                self.bonusNumberLabel.text = "\(bonusNumber)번"
                self.numberLabel.text = numberString
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callRequest(num: list[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(list[row])
    }
    
}
