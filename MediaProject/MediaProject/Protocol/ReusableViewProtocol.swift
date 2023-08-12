//
//  ReusableViewProtocol.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension BaseViewController: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
    
    
}

extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
