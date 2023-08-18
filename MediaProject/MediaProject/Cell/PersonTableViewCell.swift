//
//  PersonTableViewCell.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/14.
//

import UIKit
import Kingfisher

class PersonTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var characterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(people: People){
        let url = URL(string: people.profileURL)
        profileImageView.kf.setImage(with: url)
        nameLabel.text = people.name
        characterLabel.text = people.character
    }
}
