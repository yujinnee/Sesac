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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(video: Video){
        print("======================")
        print("======================")
        print(video.releaseDate)
        print("======================")
        print("======================")
        releaseDateLabel.text = video.releaseDate
        genreLabel.text = "#"+video.genre
        let url = URL(string: video.imageURL)
        print(url)
        thumbnailImageView.kf.setImage(with: url)
        titleLabel.text = video.title
        overviewLabel.text = video.overview
        
    }
    
}
