//
//  MovieTableViewCell.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/30.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    func configure(movie:Movie){
        posterImageView.image = movie.posterImage
        titleLabel.text = movie.title
        infoLabel.text = String("\(movie.releaseDate) |\(movie.runtime)분 |\(movie.rate)점")
        overviewLabel.text = movie.overview
    }
}
