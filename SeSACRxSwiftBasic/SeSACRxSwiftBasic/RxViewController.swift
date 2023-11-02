//
//  RxViewController.swift
//  SeSACRxSwiftBasic
//
//  Created by jack on 2023/10/23.
//

import UIKit
import RxSwift
import RxCocoa

class RxViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var changeButton: UIButton!
    var nickname = Observable.just("고래밥")
    
    @IBOutlet var timerLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sample()
        
        nickname
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        nickname
            .subscribe { value in //Observable
                print(value)
                self.nameLabel.text = value
            } onError: { error in
                print("nickname - onError")
            } onCompleted: {
                print("nickname - onCompleted")
            } onDisposed: {
                print("nickname - Disposed")
            }
            .disposed(by: disposeBag)//구독 취소
 
        changeButton.rx.tap
            .subscribe { value in
                print("버튼 클릭 \(value)")
            } onError: { error in
                print("changeButton - onError")
            } onCompleted: {
                print("changeButton - onCompleted")
            } onDisposed: {
                print("changeButton - Disposed")
            }
            .dispose()
        
//        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//            .subscribe { value in
//                print("value")
//                self.timerLabel.text = "\(value)"
//            } onError: { error in
//                print("interval - \(error)")
//            } onCompleted: {
//                print("interval completed")
//            } onDisposed: {
//                print("interval disposed")
//            }
//            .disposed(by: disposeBag)
    } 
    
    func sample() {
        let item = [2,3,4,5,6,7,100]
        let item2 = [3,5,7]
        
        Observable.repeatElement("Jack")
            .take(5)
            .subscribe { value in
                print("subscribe - \(value)")
            } onError: { error in
                print("error - \(error)")
            } onCompleted: {
                print("onCompleted")
            } onDisposed: {
                print("onDisposed")
            }
            .disposed(by: disposeBag)
        
    }
}
