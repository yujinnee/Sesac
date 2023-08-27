//
//  MenuLabel.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit

class MenuLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        font = UIFont.systemFont(ofSize: 15, weight: .light)
        textColor = .white
        

    }

}
