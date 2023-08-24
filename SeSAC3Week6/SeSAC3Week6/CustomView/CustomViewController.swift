//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit

class CustomViewController: UIViewController {
    
    let idTextField = {
        let view = BlackRadiusTextField()
        view.setupView()
        view.placeholder = "아이디를 입력해주세요"
        return view
    }()
    
    let passwordTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.textColor = .black
        view.placeholder = "비밀번호를 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
    
}
