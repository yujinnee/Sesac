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
    
    func configure(movie: Movie){
        titleLabel.text = movie.title
        rateLabel.text = String(movie.rate)
        posterImageView.image = UIImage(named:movie.title)
        let randomR = CGFloat.random(in: 0...1)
        let randomG = CGFloat.random(in: 0...1)
        let randomB = CGFloat.random(in: 0...1)
        backgroundColor = UIColor(cgColor: CGColor(red: randomR, green: randomG, blue: randomB, alpha: 1))
        layer.cornerRadius = 10
    }
    
}
