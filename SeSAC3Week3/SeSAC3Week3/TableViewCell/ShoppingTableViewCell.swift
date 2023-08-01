//
//  ShoppingTableViewCell.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit
protocol likeButtonTappedDelegate: AnyObject{
    func likeButtonTapped(idx:Int)
        
}

class ShoppingTableViewCell: UITableViewCell {
    static let identifier = "ShoppingTableViewCell"
    
    var idx = 0
    weak var delegate: likeButtonTappedDelegate?
    @IBOutlet var checkBoxImageView: UIImageView!
    @IBOutlet var shoppingLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        delegate?.likeButtonTapped(idx: idx)
    }
    func configure(item:ShoppingItem,idx:Int){
        self.idx = idx
        checkBoxImageView.image = item.isChecked ? UIImage(systemName: "checkmark.square.fill"):UIImage(systemName: "checkmark.square")
        shoppingLabel.text = item.name
        likeButton.setImage(item.isLiked ? UIImage(systemName: "star.fill"):UIImage(systemName: "star"), for: .normal)
    }
}
