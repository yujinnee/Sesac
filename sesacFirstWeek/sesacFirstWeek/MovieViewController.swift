//
//  MovieViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {

   
    @IBOutlet var previewFirstImageView: UIImageView!
    @IBOutlet var previewSecondImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var informationLabel: UILabel!
    let random = ["부산행","도둑들","명량","암살"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRandomMovie()
        designPreviewImageView(posterImageView, borderColor: UIColor.yellow.cgColor )
        designPreviewImageView(previewFirstImageView, borderColor: UIColor.green.cgColor)
        designRandomPlayButton()
       
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
       showRandomMovie()
    }
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "이곳이 타이틀입니다", message: "이러쿵 저러쿵 내용을 작성해주세요!", preferredStyle: .alert)
//        let alert = UIAlertController(title: "이곳이 타이틀입니다", message: "이러쿵 저러쿵 내용을 작성해주세요!", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    func showRandomMovie() {
        var random = [1,2,3,4,5]
        var randomResult = random.randomElement()!
        previewSecondImageView.image = UIImage(named: "\(randomResult)")
    }
    
    func designPreviewImageView(_ name: UIImageView, borderColor: CGColor){
        name.layer.cornerRadius = 30
        name.layer.borderColor = borderColor
        name.layer.borderWidth = 5
        name.backgroundColor = UIColor.blue
        name.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    func designRandomPlayButton(){
        randomPlayButton.setImage(UIImage(named: "play_normal"), for: .normal)
        randomPlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
    
        randomPlayButton.layer.cornerRadius = 10
        randomPlayButton.layer.borderColor = UIColor.red.cgColor
        randomPlayButton.layer.borderWidth = 4
    }
    
}
