//
//  MovieViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    //    @IBOutlet var previewFirstImageView: UIImageView!
    //    @IBOutlet var previewSecondImageView: UIImageView!
    //    @IBOutlet var previewThirdImageView: UIImageView!
    //    @IBOutlet var posterImageView: UIImageView!
    //
    //    @IBOutlet var randomPlayButton: UIButton!
    //    @IBOutlet var informationLabel: UILabel!
    let backgroundImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "어벤져스엔드게임")
        return view
    }()
    let gradationImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        return view
    }()
    
    let manuBarView =  {
        let view = UIView()
       
        return view
    }()
    
    let logoLabel = {
        let view = UILabel()
        view.text = "N"
        view.font = UIFont.systemFont(ofSize: 40, weight: .black)
        view.textColor = .white
        return view
    }()
    let tvProgramMenuButton = {
        let view = MenuLabel()
        view.text = "TV 프로그램"
        return view
    }()
    let movieMenuButton = {
        let view = MenuLabel()
        view.text = "영화"
        return view
    }()
    let myZzimMenuButton = {
        let view = MenuLabel()
        view.text = "내가 찜한 콘텐츠"
        return view
    }()
    
    let zzimButton = {
        let view = WhiteIconLabelButtonView()
        view.setTitle(title: "내가 찜한 콘텐츠")
        view.iconImageView.image = UIImage(systemName: "checkmark")
        return view
    }()
    let playButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "play_normal"), for: .normal)
        view.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        view.layer.cornerRadius = 4
        return view
    }()
    let infoButton = {
        let view = WhiteIconLabelButtonView()
        view.setTitle(title: "정보")
        view.iconImageView.image = UIImage(systemName: "info.circle")
        return view
    }()
    let previewLabel = {
        let view = UILabel()
        view.text = "미리보기"
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    let previewFirstImageView = {
        var random = [1,2,3,4,5]
        var randomResult = random.randomElement()!
        let view = CircleImageView(image:  UIImage(named: "\(randomResult)"))
        
        return view
    }()
    let previewSecondImageView = {
        var random = [1,2,3,4,5]
        var randomResult = random.randomElement()!
        let view = CircleImageView(image:  UIImage(named: "\(randomResult)"))
        return view
    }()
    let previewThirdImageView = {
        var random = [1,2,3,4,5]
        var randomResult = random.randomElement()!
        let view = CircleImageView(image:  UIImage(named: "\(randomResult)"))
        return view
    }()
    
    
    let random = ["부산행","도둑들","명량","암살"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
//        showRandomMovie()
//        designPreviewImageView()
//        designRandomPlayButton()
       
    }
    func setupConstraints() {
        
        [backgroundImageView,gradationImageView,manuBarView,zzimButton,playButton,infoButton,previewLabel,previewFirstImageView,previewSecondImageView,previewThirdImageView].forEach{
            view.addSubview($0)
        }
        
        [logoLabel,tvProgramMenuButton,movieMenuButton,myZzimMenuButton].forEach {
            manuBarView.addSubview($0)
        }
        
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(1.5)
        }
        gradationImageView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        manuBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)

        }
        logoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        tvProgramMenuButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(movieMenuButton.snp.leading).offset(-20)
        }
        movieMenuButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(myZzimMenuButton.snp.leading).offset(-20)
        }
        
        myZzimMenuButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        zzimButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.trailing.equalTo(playButton.snp.leading).offset(-60)
        }
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(previewLabel.snp.top).offset(-20)
        }
        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.leading.equalTo(playButton.snp.trailing).offset(60)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.bottom.equalTo(previewSecondImageView.snp.top).offset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        previewFirstImageView.snp.makeConstraints { make in
            make.trailing.equalTo(previewSecondImageView.snp.leading).offset(-10)
            make.centerY.equalTo(previewSecondImageView)
            make.size.equalTo(100)
        }
        previewSecondImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
            make.bottom.equalToSuperview().offset(-80)
        }
        previewThirdImageView.snp.makeConstraints { make in
            make.leading.equalTo(previewSecondImageView.snp.trailing).offset(10)
            make.centerY.equalTo(previewSecondImageView)
            make.size.equalTo(100)
        }
        
        
        
        
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
        backgroundImageView.image = UIImage(named: "\(randomResult)")
        
    }
    
//    func designPreviewImageView(){
//        designImageView(previewFirstImageView, cornerRadius: 20, borderColor: UIColor.yellow, borderWidth: 5, backgroundColor: UIColor.red, contentMode: .scaleAspectFill)
//        designImageView(previewSecondImageView, cornerRadius: 10, borderColor: UIColor.systemPink, borderWidth: 20, backgroundColor: UIColor.green, contentMode: .scaleAspectFill)
//        designImageView(previewThirdImageView, cornerRadius: 40, borderColor: UIColor.blue, borderWidth: 10, backgroundColor: UIColor.brown, contentMode: .scaleAspectFill)
//    }
    
//    func designImageView(_ name: UIImageView,cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat,backgroundColor: UIColor,contentMode: UIView.ContentMode){
//        name.layer.cornerRadius = cornerRadius
//        name.layer.borderColor = borderColor.cgColor
//        name.layer.borderWidth = borderWidth
//        name.backgroundColor = UIColor.blue
//        name.contentMode = contentMode
////        name.contentMode = UIView.ContentMode.scaleAspectFill
//    }
    
//    func designRandomPlayButton(){
//        randomPlayButton.setImage(UIImage(named: "play_normal"), for: .normal)
//        randomPlayButton.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
//
//
//        randomPlayButton.layer.cornerRadius = 10
//        randomPlayButton.layer.borderColor = UIColor.red.cgColor
//        randomPlayButton.layer.borderWidth = 4
//    }
//
}
