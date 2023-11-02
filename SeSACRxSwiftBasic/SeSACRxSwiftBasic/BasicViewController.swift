//
//  BasicViewController.swift
//  SeSACRxSwiftBasic
//
//  Created by 이유진 on 10/25/23.
//

import UIKit
import RxSwift
import RxCocoa

class BasicViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        basicTableView()
        basicButton()
        basicValidation()
    }
    
    func basicTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])

        items
        .bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = "\(element) @ row \(row)"
            return cell
        }
        .disposed(by: disposeBag)
        
        tableView
            .rx
            .modelSelected(String.self)
            .map{ data in
                "\(data)를 클릭했어요."
            }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        

    }
    
    //bind: 메인 쓰레드, error X, completed X. UI,
    //drive: Bind+스트림 공유
    func shareButton() {
        let sample = button.rx.tap
            .map {"안녕하세요 \(Int.random(in: 1...100))"}
            .share() //share가 있을 떄 없을때 달라지는 거 확인하기
        
        sample
            .bind(to:label.rx.text)
            .disposed(by: disposeBag)
        
        sample
            .bind(to:textField.rx.text)
            .disposed(by: disposeBag)
        
        sample
            .bind(to:button.rx.title())
            .disposed(by: disposeBag)
        
    
    }
    
    func basicValidation() {
        textField
            .rx
            .text
            .orEmpty
            .map{$0.count > 4}
            .bind(to:button.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    func basicButton() {
        button.rx.tap
            .observe(on: MainScheduler.instance) //메인쓰레드에서 동작하게끔 수정
            .subscribe{ _ in //next, complete, error 다 전달 가능
                print("클릭되었습니다")
                self.label.text = "클릭되었습니다"
                self.textField.text = "클릭되었습니다"
                
            } onDisposed: {
                print("Disposed")
            }
            .disposed(by:disposeBag)
        
        button.rx.tap
            .bind { _ in // next 만 가능. 메인 쓰레드 동작 보장
                print("클릭되었습니다")
                self.label.text = "클릭되었습니다"
                self.textField.text = "클릭되었습니다"
                
            }
            .disposed(by: disposeBag)
        
        button.rx.tap
            .map{"클릭했습니다"}
            .bind(to: label.rx.text, textField.rx.text)
            .disposed(by: disposeBag)
    }
    
    

}

