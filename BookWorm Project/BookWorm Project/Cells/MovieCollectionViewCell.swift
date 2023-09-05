//
//  MovieCollectionViewCell.swift
//  BookWorm Project
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit
import Kingfisher

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
    
    func configure(book: BookTable){
        titleLabel.text = book.title
        rateLabel.text = "₩\(book.price)"
        let url = URL(string: book.thumbnailURL)
        posterImageView.kf.setImage(with: url)
        var buttonImage = book.favorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        heartButton.setImage(buttonImage, for: .normal)
    }
    
    func configure(book: BookData){
        titleLabel.text = book.title
        rateLabel.text = "₩\(book.price)"
        let url = URL(string: book.thumbnailURL)
        posterImageView.kf.setImage(with: url)
        var buttonImage = book.favorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        heartButton.setImage(buttonImage, for: .normal)
    }
   
}
