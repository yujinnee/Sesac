//
//  Constant.swift
//  Week10
//
//  Created by 이유진 on 2023/09/22.
//

import UIKit

enum Constant {
    enum Text {
        static let title = UIColor(named: "title")!
    }
    enum Image {
        static let star = UIImage(systemName: "star")!.withRenderingMode(.alwaysTemplate).withTintColor(Constant.Text.title)
    }
}
