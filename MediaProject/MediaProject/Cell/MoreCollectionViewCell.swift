//
//  MoreCollectionViewCell.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit
import Kingfisher

class MoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: SimilarVideo){
        let url = URL(string: data.posterURL)
        thumbnailImage.kf.setImage(with: url)
        titleLabel.text = data.title
        dateLabel.text = data.releaseDate
    }
    func setData(data: VideosVideo){
        let url = URL(string: data.thumbnailURL)
        thumbnailImage.kf.setImage(with: url)
        titleLabel.text = data.name
        dateLabel.text = data.publishedAt
        
    }
    
}
