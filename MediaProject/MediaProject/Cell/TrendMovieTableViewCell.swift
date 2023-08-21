//
//  TrendMovieTableViewCell.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/12.
//

import UIKit
import Kingfisher

class TrendMovieTableViewCell: UITableViewCell {
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    @IBOutlet var originalTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(video: Video){
  
        releaseDateLabel.text = video.releaseDate
        genreLabel.text = "#"+video.genre
        let url = URL(string: video.imageURL)

        thumbnailImageView.kf.setImage(with: url)
        titleLabel.text = video.title
        overviewLabel.text = video.overview
        originalTitle.text = video.originalTitle
        
    }
    
}
