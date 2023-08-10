//
//  BookTableViewCell.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/08/09.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
    static let identifier = "BookTableViewCell"

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
        
    }
    
    func design(){
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        descriptionLabel.numberOfLines = 1
        contentsLabel.numberOfLines = 0
    }
    func setData(data: Book){
        let url = URL(string: data.thumbnail)
        thumbnailImageView.kf.setImage(with: url)
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        contentsLabel.text = data.contents
    }
    
    

}
