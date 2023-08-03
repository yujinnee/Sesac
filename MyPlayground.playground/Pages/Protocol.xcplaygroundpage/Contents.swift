//: [Previous](@previous)

import UIKit

//protocol JackTableViewProtocol {
//    func numberOfRowsInSection() -> Int
//    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
//}
//
//class vc: UIViewController,JackTableViewProtocol {
//    func numberOfRowsInSection() -> Int {
//
//    }
//    func cellForRowAt(indexPath: IndexPath) => UITableViewCell {
//
//    }
//}

//명세만 작성되어 있고, 단순한 선언 형태로 구성되어 있어서, 구체적인 내용은 별도로 구현이 이루어짐
//특정 명세를 따르는 타입(클래스, 구조체 등)은 ‘프로토콜을 준수한다’라고 표현함
//실질적인 구현(내용)은 클래스, 열거형, 구조체 등에서 이루어짐
protocol ViewPresentableProtocol {
    //최소 요구 사항으로, get 만 할 수도 있고 set도 할
    var navigationTitle: String {get set}
    var backgroundColor: UIColor {get}
    var identifier: String {get}
    
    func configureView()
    func configureLabel()
    func configureTextField()
}

class A:UIViewController, ViewPresentableProtocol {
    
    var navigationTitle: String = ""
    var backgroundColor: UIColor = .red
    var identifier: String = "identifier"
    
    func configureTextField() {
        <#code#>
    }
    
    func configureView() {
        <#code#>
    }
    
    func configureLabel() {
        <#code#>
    }
    
}

class B: UIViewController,ViewPresentableProtocol{
    var navigationTitle = "나의 일기장"
    
    var backgroundColor: UIColor {
        return .black
    }
    
    var identifier: String {
        return "BViewController"
    }
    
    func configureView() {
        <#code#>
    }
    
    func configureLabel() {
        <#code#>
    }
    
    func configureTextField() {
        <#code#>
    }
    
    
}

//: [Next](@next)
