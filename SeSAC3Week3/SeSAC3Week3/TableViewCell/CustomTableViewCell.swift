//
//  CustomTableViewCell.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTableViewCell"
    
    @IBOutlet var backView: UIView!
    @IBOutlet var checkboxImageView: UIImageView!
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    var index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitleLabel.font = .boldSystemFont(ofSize: 17)
        mainTitleLabel.textColor = .brown
        
        likeButton.tag = index
        likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func likeButtonClicked() {
        
    }
    
    
    func configureCell(row: ToDo){
        backView.backgroundColor = row.color
        mainTitleLabel.text = row.main
        subTitleLabel.text = row.sub
        checkboxImageView.image = row.done ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        likeButton.setImage(row.like ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
    }
    
    
}
