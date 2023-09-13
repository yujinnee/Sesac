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
    let viewModel = LottoViewModel()
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var firstNumLabel: UILabel!
    
    @IBOutlet var secondNumLabel: UILabel!
    
    @IBOutlet var thirdNumLabel: UILabel!
    
    @IBOutlet var fourthNumLabel: UILabel!
    
    @IBOutlet var fifthNumLabel: UILabel!
    
    @IBOutlet var sixthNumLabel: UILabel!
    
    @IBOutlet var bonusNumberLabel: UILabel!
    
    @IBOutlet var numPickerView: UIPickerView!
  
    @IBOutlet var eventNumLabel: UILabel!
    let recentCount = 0
    

    var pickerOptionList: [Int] = Array(1...1079).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.date.bind(completion: { date in
            self.dateLabel.text = date
        })
//        viewModel.numbers[0].bind(completion: { number in
//            self.firstNumLabel.text = String(number)
//
//        })
//        viewModel.numbers[1].bind(completion: { number in
//            self.secondNumLabel.text = String(number)
//
//        })
//        viewModel.numbers[2].bind(completion: { number in
//            self.thirdNumLabel.text = String(number)
//
//        })
//        viewModel.numbers[3].bind(completion: { number in
//            self.fourthNumLabel.text = String(number)
//
//        })
//        viewModel.numbers[4].bind(completion: { number in
//            self.fifthNumLabel.text = String(number)
//
//        })
//        viewModel.numbers[5].bind(completion: { number in
//            self.sixthNumLabel.text = String(number)
//
//        })
        viewModel.numbers.bind(completion: { numbers in
            self.firstNumLabel.text = String(numbers[0])
            self.secondNumLabel.text = String(numbers[1])
            self.thirdNumLabel.text = String(numbers[2])
            self.fourthNumLabel.text = String(numbers[3])
            self.fifthNumLabel.text = String(numbers[4])
            self.sixthNumLabel.text = String(numbers[5])
           
        })
       
        viewModel.bonusNumber.bind(completion: { bonusNumber in
            self.bonusNumberLabel.text = String(bonusNumber)
        })
        viewModel.eventNum.bind(completion: { num in
            self.eventNumLabel.text = String(num)
        })
        viewModel.date.bind(completion: { num in
            self.dateLabel.text = String(num)
        })

//        callRequest(num: 1079)
        
      
//       let today = Date()
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = ("yyyy-mm-dd")
//        let first = formatter.date(from: "2002-12-07")
//
//        let intervalSec = today.timeIntervalSince(first ?? Date())
//        let intervalDay = Int(intervalSec)/(3600*24)
//        let count = intervalDay/7
//
//
//        print(intervalDay)
//        print(intervalDay)
//        print(count)
        
        numPickerView.delegate = self
        numPickerView.dataSource = self


    }
  
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        callRequest(num: list[row])
        viewModel.eventNum.value = pickerOptionList[row]
        viewModel.callRequest()
    
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerOptionList[row])
    }
    
}
