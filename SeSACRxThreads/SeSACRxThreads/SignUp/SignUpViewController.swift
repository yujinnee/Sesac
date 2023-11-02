//
//  SignUpViewController.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

enum JackError: Error {
    case invalid
}

class SignUpViewController: UIViewController {

    let emailTextField = SignTextField(placeholderText: "이메일을 입력해주세요")
    let validationButton = UIButton()
    let nextButton = PointButton(title: "다음")
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color.white
        
        configureLayout()
        configure()
        
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
//        disposeExample()
//        incrementExample()
        aboutPublishSubject()

    }
    func aboutAsyncSubject() {
        let publish = AsyncSubject<Int>()
        publish.onNext(20)
        publish.onNext(30)
        
        publish
            .subscribe(with: self) { owner, value in
                print("PublishSubject - \(value)")
            } onError: { owner, error in
                print("PublishSubject - \(error)")
            } onCompleted: { owner in
                print("PublishSubject completed")
            } onDisposed: { owner in
                print("PublishSubject disposed")
            }
            .disposed(by: disposeBag)
        
        publish.onNext(3)
        publish.onNext(4)
        publish.on(.next(9))
        
        publish.onCompleted()
        
        publish.onNext(6)
        publish.onNext(7)
    }
    
  
    
    func aboutReplaysubject() {
        let publish = ReplaySubject<Int>.create(bufferSize:  2)
        publish.onNext(20)
        publish.onNext(30)
        
        publish
            .subscribe(with: self) { owner, value in
                print("ReplaySubject - \(value)")
            } onError: { owner, error in
                print("ReplaySubject - \(error)")
            } onCompleted: { owner in
                print("ReplaySubject completed")
            } onDisposed: { owner in
                print("ReplaySubject disposed")
            }
            .disposed(by: disposeBag)
        
        publish.onNext(3)
        publish.onNext(4)
        publish.on(.next(9))
        
        publish.onCompleted()
        
        publish.onNext(6)
        publish.onNext(7)
    }
    func aboutPublishSubject() {
        let publish = PublishSubject<Int>()
        publish.onNext(20)
        publish.onNext(30)
        
        publish
            .subscribe(with: self) { owner, value in
                print("PublishSubject - \(value)")
            } onError: { owner, error in
                print("PublishSubject - \(error)")
            } onCompleted: { owner in
                print("PublishSubject completed")
            } onDisposed: { owner in
                print("PublishSubject disposed")
            }
            .disposed(by: disposeBag)
        
        publish.onNext(3)
        publish.onNext(4)
        publish.on(.next(9))
        
        publish.onCompleted()
        
        publish.onNext(6)
        publish.onNext(7)
    }
    func disposeExample() {
        let textArray = BehaviorSubject(value: ["Hue", "Jack","Koko","Bran"])

        let textArrayValue = textArray
                                .subscribe(with: self) { owner, value in
                                    print("next - \(value)")
                                } onError: { owner, error in
                                    print("error = \(error)")
                                } onCompleted: { owner in
                                    print("completed")
                                } onDisposed: { owner in
                                    print("disposed")
                                }
                                
        
        textArray.onNext(["A","B","C"])
        
        textArray.onNext(["D","E","F"])
        
//        textArray.onError(JackError.invalid)
//        
        textArray.onNext(["Z", "Z"])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            textArrayValue.dispose()
        }

    }
    func incrementExample() {
        let increment = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        increment
            .subscribe(with: self) { owner, value in
                print("next - \(value)")
            } onError: { owner, error in
                print("error = \(error)")
            } onCompleted: { owner in
                print("completed")
            } onDisposed: { owner in
                print("disposed")
            }

    }
    @objc func nextButtonClicked() {
        navigationController?.pushViewController(PasswordViewController(), animated: true)
    }

    func configure() {
        validationButton.setTitle("중복확인", for: .normal)
        validationButton.setTitleColor(Color.black, for: .normal)
        validationButton.layer.borderWidth = 1
        validationButton.layer.borderColor = Color.black.cgColor
        validationButton.layer.cornerRadius = 10
    }
    
    func configureLayout() {
        view.addSubview(emailTextField)
        view.addSubview(validationButton)
        view.addSubview(nextButton)
        
        validationButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(validationButton.snp.leading).offset(-8)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    

}
