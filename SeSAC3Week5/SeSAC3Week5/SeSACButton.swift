//
//  SeSACButton.swift
//  SeSAC3Week5
//
//  Created by 이유진 on 2023/08/21.
//

import UIKit


@IBDesignable
class SeSACButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat{
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    @IBInspectable
    var borderWidth: CGFloat{
        get { return layer.borderWidth }
        set { layer.cornerRadius = newValue }
    }
    @IBInspectable
    var borderColor: CGColor{
        get { return layer.borderColor! }
        set { layer.borderColor = newValue
        }
    }

}
