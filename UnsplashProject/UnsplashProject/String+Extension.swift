//
//  String+Extension.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(number: Int) -> String {
        return String (format: self.localized, number)
    }
}

