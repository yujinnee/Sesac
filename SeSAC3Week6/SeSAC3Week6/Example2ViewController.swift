//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/23.
//

import UIKit

class Example2ViewController: UIViewController {
    
    let backgroundView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    let upperView = {
        let view = UIView()
        return view
    }()
    
    let closeButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        return button
    }()
    let presentButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        return button
    }()
    let codeButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        return button
    }()
    let settingButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        return button
    }()
    
    let photoImageView  = {
        let view = UIImageView()
        view.backgroundColor = .systemMint
        return view
    }()
    
    let nameLabel = {
        let label = UILabel()
        label.text = "Lizzy"
        label.textAlignment = .center
        return label
    }()
    let statusMessageLabel = {
        let label = UILabel()
        label.text = "졸업이당"
        label.textAlignment = .center
        return label
    }()
    let seperateLineView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    let lowerView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    let ChattingWithMeButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    let EditProfileButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        return button
    }()
    let KakaoStoryButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
      
    }
    
    func setupConstraints() {
        view.addSubview(backgroundView)
        
        backgroundView.addSubview(upperView)
        backgroundView.addSubview(photoImageView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(statusMessageLabel)
        backgroundView.addSubview(seperateLineView)
        backgroundView.addSubview(lowerView)
        
        upperView.addSubview(closeButton)
        upperView.addSubview(presentButton)
        upperView.addSubview(codeButton)
        upperView.addSubview(settingButton)
        
        lowerView.addSubview(ChattingWithMeButton)
        lowerView.addSubview(EditProfileButton)
        lowerView.addSubview(KakaoStoryButton)
        
        
        backgroundView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        upperView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        closeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(30)
        }
        presentButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(codeButton.snp.leading).offset(-10)
            make.size.equalTo(30)
        }
        codeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(settingButton.snp.leading).offset(-10)
            make.size.equalTo(30)
        }
        settingButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.size.equalTo(30)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).offset(-10)
            make.size.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(statusMessageLabel.snp.top).offset(-10)
        }
        
        statusMessageLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(seperateLineView.snp.top).offset(-50)
        }
        seperateLineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(lowerView.snp.top)
            make.height.equalTo(1)
        }
        lowerView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        ChattingWithMeButton.snp.makeConstraints { make in
            make.centerY.equalTo(EditProfileButton)
            make.trailing.equalTo(EditProfileButton.snp.leading).offset(-30)
            make.size.equalTo(70)
        }
        EditProfileButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.size.equalTo(70)
        }
        KakaoStoryButton.snp.makeConstraints { make in
            make.centerY.equalTo(EditProfileButton)
            make.leading.equalTo(EditProfileButton.snp.trailing).offset(30)
            make.size.equalTo(70)
        }
        
        
        
        
    }
}
