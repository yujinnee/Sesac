//
//  whiteIconLabelButton.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit
import SnapKit

class WhiteIconLabelButtonView: UIView {
    
    let iconImageView = {
        let view = UIImageView()
        view.tintColor = .white
        return view
        
    }()
    let titleLabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstarint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstarint(){
        addSubview(iconImageView)
        addSubview(titleLabel)
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(18)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView)
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
        }
     
    }
    func setTitle(title: String){
        titleLabel.text = title
    }
}
