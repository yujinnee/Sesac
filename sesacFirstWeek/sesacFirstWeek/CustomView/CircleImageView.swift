//
//  circleImageView.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit

class CircleImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.width/2
        layer.borderColor = UIColor.brown.cgColor
        layer.borderWidth = 2
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }

}
