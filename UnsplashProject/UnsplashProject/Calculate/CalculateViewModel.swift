//
//  CalculateViewModel.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    var firstNumber: CustomObservable<String?> = CustomObservable("3")
    var secondNumber:CustomObservable<String?> = CustomObservable("7")
    
    var resultText:CustomObservable<String?> = CustomObservable("결과는 30입니다")
    var tempText:CustomObservable<String?> = CustomObservable("테스트를 위한 테스트라벨")
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    func parentNumberFormat() {
        guard let first = firstNumber.value, let firstConvertNumber = Int(first) else {
            tempText.value = "숫자로 변환할 수 없는 문자입니다."
            return
        }
        tempText.value = format(for: firstConvertNumber)
    }
    func calculate() {
        guard let first = firstNumber.value, let firstConverNumber = Int(first) else {
            resultText.value = "첫번째 값에서 요류가 발생했어요"
            return
        }
        guard let second = secondNumber.value, let secondConvertNumber = Int(second) else {
            resultText.value = "두번쨰 값에서 오류가 발생했어요"
            return }
        
        resultText.value = "결과는 \(firstConverNumber + secondConvertNumber)입니다"
    }
}
