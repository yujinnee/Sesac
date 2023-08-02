//
//  RecentCollectionViewCell.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/08/02.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecentCollectionViewCell"

    @IBOutlet var posterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(movie:Movie){
        posterImageView.image = UIImage(named: movie.title)
    }

}
