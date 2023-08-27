//
//  PosterImageView.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
//        print(frame.width,frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        layer.cornerRadius = frame.width/2
        print("setupView",frame.width)
        print(layer.cornerRadius)
        print(#function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        print("layoutSubView", frame.width,frame)
        print("layoutSubview",frame.width)
        layer.cornerRadius = frame.width / 2
        print(layer.cornerRadius)
    }
}
