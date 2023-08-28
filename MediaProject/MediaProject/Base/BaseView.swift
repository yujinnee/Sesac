//
//  BaseView.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit
import SnapKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(){
        
    }
    
    func setConstraints() {
        
    }
}
