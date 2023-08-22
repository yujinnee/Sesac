//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/21.
//

import UIKit
//1. 객체 얹고, 레이아웃 잡고, 아웃렛 연결, 속성 조절

//1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가
//3. 크기와 위치 정의
//4. 속성 정의
//=> Frame 한계
//=> AutoResizingMask, AutoLayout -> 스토리보드 대응
//=> NSLayoutConstraints => 코드베이스 대응
    // 1.isActive
    // 2. addConstraints
//=>NSLayoutAnchor


class ViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
      
        
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "내용을 입력해주세요"
        
        setLayoutAnchor()

//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
       let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)

        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)

        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)

        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)

        view.addConstraints([leading, trailing,height,top])


        passwordTextField.backgroundColor = .red
    }
    
    @objc func signButtonClicked() {
      
//        let vc = LocationViewController()
        let vc = TextViewController()
//        let vc = Example2ViewController
        present(vc,animated:true)
        
    }
    
    
    func setLayoutAnchor() {
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.backgroundColor = .blue
        
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     signButton.widthAnchor.constraint(equalToConstant: 300),
                                     signButton.heightAnchor.constraint(equalToConstant: 50),
                                     signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        
    }
    
}

