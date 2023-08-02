//
//  HotContentsTableViewCell.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/08/02.
//

import UIKit

class HotContentsTableViewCell: UITableViewCell {
    static let identifier = "HotContentsTableViewCell"
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(movie:Movie){
        posterImageView.image = UIImage(named: movie.title)
        titleLabel.text = movie.title
        descriptionLabel.text = "\(movie.releaseDate)개봉 | \(movie.runtime)분"
        rateLabel.text = "\(movie.rate)"
    }
}
