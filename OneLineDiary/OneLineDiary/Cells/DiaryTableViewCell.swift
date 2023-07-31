//
//  DiaryTableViewCell.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    static let identifier = "DiaryTableViewCell"

    @IBOutlet var backView: UIView!
    @IBOutlet var contentLabel: UILabel!
    
    func configure(text: String) {
        contentLabel.text = text
    }
}
