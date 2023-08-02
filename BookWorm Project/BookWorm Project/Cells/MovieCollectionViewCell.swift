//
//  MovieCollectionViewCell.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var heartButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    func configure(movie: Movie){
        let randomColor = UIColor(cgColor: CGColor(red: movie.red, green: movie.green, blue: movie.blue, alpha: 1))
        backgroundColor = randomColor
        titleLabel.text = movie.title
        rateLabel.text = String(movie.rate)
        posterImageView.image = UIImage(named:movie.title)
        var buttonImage = movie.favorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        heartButton.setImage(buttonImage, for: .normal)
        
    }
   
}
