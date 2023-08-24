//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit
import SnapKit

class BlackRadiusTextField: UITextField {

    
    override init(frame: CGRect) {// uiview
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {//
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        placeholder = "아이디를 입력해주세요"
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
    
}

