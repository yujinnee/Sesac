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
    @IBOutlet var previewThirdImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var informationLabel: UILabel!
    let random = ["부산행","도둑들","명량","암살"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRandomMovie()
        designPreviewImageView()
        designRandomPlayButton()
       
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
       showRandomMovie()
    }
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "이곳이 타이틀입니다", message: "이러쿵 저러쿵 내용을 작성해주세요!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    func showRandomMovie() {
        var random = [1,2,3,4,5]
        var randomResult = random.randomElement()!
        previewFirstImageView.image = UIImage(named: "\(randomResult)")
        randomResult = random.randomElement()!
        previewSecondImageView.image = UIImage(named: "\(randomResult)")
        randomResult = random.randomElement()!
        previewThirdImageView.image = UIImage(named: "\(randomResult)")
        randomResult = random.randomElement()!
        posterImageView.image = UIImage(named: "\(randomResult)")
        
    }
    
    func designPreviewImageView(){
        designImageView(previewFirstImageView, cornerRadius: 20, borderColor: UIColor.yellow, borderWidth: 5, backgroundColor: UIColor.red, contentMode: .scaleAspectFill)
        designImageView(previewSecondImageView, cornerRadius: 10, borderColor: UIColor.systemPink, borderWidth: 20, backgroundColor: UIColor.green, contentMode: .scaleAspectFill)
        designImageView(previewThirdImageView, cornerRadius: 40, borderColor: UIColor.blue, borderWidth: 10, backgroundColor: UIColor.brown, contentMode: .scaleAspectFill)
    }
    
    func designImageView(_ name: UIImageView,cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat,backgroundColor: UIColor,contentMode: UIView.ContentMode){
        name.layer.cornerRadius = cornerRadius
        name.layer.borderColor = borderColor.cgColor
        name.layer.borderWidth = borderWidth
        name.backgroundColor = UIColor.blue
        name.contentMode = contentMode
//        name.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    func designRandomPlayButton(){
        randomPlayButton.setImage(UIImage(named: "play_normal"), for: .normal)
        randomPlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        
    
        randomPlayButton.layer.cornerRadius = 10
        randomPlayButton.layer.borderColor = UIColor.red.cgColor
        randomPlayButton.layer.borderWidth = 4
    }
    
}
