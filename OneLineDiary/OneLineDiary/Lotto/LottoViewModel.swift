//
//  LottoViewModel.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation
import Alamofire
import SwiftyJSON

class LottoViewModel {
    var eventNum: Observable<Int> = Observable(0)
    var date: Observable<String> = Observable("0000-00-00")
    
//    var firstNumber: Observable<Int>?
//    var secondNumber: Observable<Int>?
//    var thirdNumber: Observable<Int>?
//    var fourthNumber: Observable<Int>?
//    var fifthNumber: Observable<Int>?
//    var sixthNumber: Observable<Int>?

    var bonusNumber: Observable<Int> = Observable(0)
//    var numbers: [Observable<Int>] = [Observable(0),Observable(0),Observable(0),Observable(0),Observable(0),Observable(0)]
    var numbers: Observable<[Int]> = Observable([0,0,0,0,0,0,0])
    
  
    
    func callRequest(){
//        eventNum.value = num
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=" + String(eventNum.value)
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                self.date.value = json["drwNoDate"].stringValue
                self.bonusNumber.value = json["bnusNo"].intValue
                
                for i in 1...6{
//                    self.numbers[i-1] = Observable(json["drwtNo\(i)"].intValue)
                    self.numbers.value[i-1] = json["drwtNo\(i)"].intValue
                }
                
              
//                self.dateLabel.text = date
//                self.bonusNumberLabel.text = "\(bonusNumber)번"
//                self.numberLabel.text = numberString
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
