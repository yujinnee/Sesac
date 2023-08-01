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
    
    func configure(movie: Movie){
        heartButton.setTitle("", for: .normal)
        heartButton.tintColor = .systemPink
        backgroundColor = movie.color
        layer.cornerRadius = 10

        
        titleLabel.text = movie.title
        rateLabel.text = String(movie.rate)
        posterImageView.image = UIImage(named:movie.title)
        var buttonImage = movie.favorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        heartButton.setImage(buttonImage, for: .normal)
        
    }
    
    
    
}
