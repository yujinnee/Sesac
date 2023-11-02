//
//  SignInViewController.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit


class SignInViewController: UIViewController {

    let emailTextField = SignTextField(placeholderText: "이메일을 입력해주세요")
    let passwordTextField = SignTextField(placeholderText: "비밀번호를 입력해주세요")
    let signInButton = PointButton(title: "로그인")
    let signUpButton = UIButton()
    
    let test = UISwitch()
    let isOn = PublishSubject<Bool>()//BehaviorSubject(value: true)//Observable.of(false)//Observable은 이벤트를 생성하고 전달만 가능
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color.white
        
        configureLayout()
        configure()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        bind()
        aboutCombineLatest()
    }
    func aboutCombineLatest() {
        let a = PublishSubject<Int>()//BehaviorSubject(value: 3)
        let b = PublishSubject<String>()//BehaviorSubject(value: "가")
        
        Observable.combineLatest(a,b) {first, second in
            return "결과: \(first) 그리고 \(second)"
        }
        .subscribe(with: self) { owner, data in
            print(data)
            
        }
        .disposed(by: disposeBag)
        
        a.onNext(2)
        a.onNext(8)
        a.onNext(5)
        
//        b.onNext("나")
//        b.onNext("다")
    }
    func bind() {
        let email = emailTextField.rx.text.orEmpty
        let password = passwordTextField.rx.text.orEmpty
        
        let validation = Observable.combineLatest(email, password) { first, second in
            return first.count > 8 && second.count >= 6
        }
        
        validation
            .bind(to: signInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        validation
            .subscribe(with: self) { owner, value in
                owner.signInButton.backgroundColor = value ? UIColor.blue : UIColor.red
                owner.emailTextField.layer.borderColor = value ? UIColor.blue.cgColor: UIColor.red.cgColor
                owner.passwordTextField.layer.borderColor = value ? UIColor.blue.cgColor : UIColor.red.cgColor
            }
            .disposed(by: disposeBag)

        
        signInButton.rx.tap
            .subscribe(with: self) { owner, value in
                print("SELECT")
            }
            .disposed(by: disposeBag)
        
    }
    func incrementExample() {
        let increment = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        let incrementValue = increment
            .subscribe(with: self) { owner, value in
                print("next - \(value)")
            } onError: { owner, error in
                print("error = \(error)")
            } onCompleted: { owner in
                print("completed")
            } onDisposed: { owner in
                print("disposed")
            }
            .disposed(by: disposeBag)
        let incrementValue2 = increment
            .subscribe(with: self) { owner, value in
                print("next - \(value)")
            } onError: { owner, error in
                print("error = \(error)")
            } onCompleted: { owner in
                print("completed")
            } onDisposed: { owner in
                print("disposed")
            }
            .disposed(by: disposeBag)
        let incrementValue3 = increment
            .subscribe(with: self) { owner, value in
                print("next - \(value)")
            } onError: { owner, error in
                print("error = \(error)")
            } onCompleted: { owner in
                print("completed")
            } onDisposed: { owner in
                print("disposed")
            }
            .disposed(by: disposeBag)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.disposeBag = DisposeBag()
//            incrementValue.dispose()
//            incrementValue2.dispose()
//            incrementValue3.dispose()
        }
    }
    
    @objc func signUpButtonClicked() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    func testSwitch() {
        view.addSubview(test)
        test.snp.makeConstraints { make in
            make.top.equalTo(150)
            make.leading.equalTo(100)
        }
        
//        isOn
//            .subscribe { value in
//                self.test.setOn(true, animated: false)
//            }
//            .disposed(by: disposeBag)
//       
        
        isOn
            .bind(to: test.rx.isOn)
            .disposed(by: disposeBag)
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isOn.onNext(false)
        }
        isOn.onNext(true)
      
        
        //UIKit
//        test.setOn(true, animated: false)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.test.setOn(false, animated: true)
//        }
        
    }
    
    
    func configure() {
        signUpButton.setTitle("회원이 아니십니까?", for: .normal)
        signUpButton.setTitleColor(Color.black, for: .normal)
    }
    
    func configureLayout() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(signInButton.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    

}
