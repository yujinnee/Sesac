//
//  ProfileView.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class ProfileView: BaseView {
    
    let profileImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person")
        view.layer.cornerRadius = view.frame.width/2
        view.tintColor = .white
        view.backgroundColor = .systemBlue
        return view
    }()
    let profilelAvatarReviseButton = {
        let view = UIButton()
        view.setTitle("사진 또는 아바타 수정", for: .normal)
        view.setTitleColor(UIColor.systemBlue, for: .normal)
        return view
    }()
    let nameTitleLabel = {
        let view = UILabel()
        view.text = "이름"
        view.textColor = .black
        return view
    }()
    let nameContentsButton = {
        let view = UIButton()
        view.setTitle("jack", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let userNameTitleLabel = {
        let view = UILabel()
        view.text = "사용자 이름"
        view.textColor = .black
        return view
    }()
    let userNameContentsButton = {
        let view = UIButton()
        view.setTitle("jack_Jack", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let genderPronounTitleLabel = {
        let view = UILabel()
        view.text = "성별 대명사"
        view.textColor = .black
        return view
    }()
    let genderPronounContentsButton = {
        let view = UIButton()
        view.setTitle("성별 대명사", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let introductionTitleLabel = {
        let view = UILabel()
        view.text = "소개"
        view.textColor = .black
        return view
    }()
    let introductionContentsButton = {
        let view = UIButton()
        view.setTitle("소개", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let linkTitleLabel = {
        let view = UILabel()
        view.text = "링크"
        view.textColor = .black
        return view
    }()
    let linkContentsButton = {
        let view = UIButton()
        view.setTitle("링크 추가", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let genderTitleLabel = {
        let view = UILabel()
        view.text = "성별"
        view.textColor = .black
        return view
    }()
    let genderContentsButton = {
        let view = UIButton()
        view.setTitle("성별", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        view.contentHorizontalAlignment = .left
        return view
    }()
    let switchToProfessionalAccountButton = {
        let view = UIButton()
        view.setTitle("프로페셔녈 계정으로 전환", for: .normal)
        view.titleLabel?.textColor = .systemBlue
        return view
    }()
    let setPrivacyInformationSettingButton = {
        let view = UIButton()
        view.setTitle("개인 정보 설정", for: .normal)
        view.titleLabel?.textColor = .systemBlue
        return view
    }()
    
    override func setConstraints() {
        [profileImageView,profilelAvatarReviseButton,nameTitleLabel,nameContentsButton,userNameTitleLabel,userNameContentsButton,genderPronounTitleLabel,genderPronounContentsButton,introductionTitleLabel,introductionContentsButton,linkTitleLabel,linkContentsButton,genderTitleLabel,genderContentsButton,switchToProfessionalAccountButton,setPrivacyInformationSettingButton].forEach{
            addSubview($0)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
        }
        profilelAvatarReviseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            
        }
        nameTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(profilelAvatarReviseButton.snp.bottom).offset(30)
        }
        nameContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameTitleLabel)
            make.leading.equalTo(nameTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        userNameTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(30)
        }
        userNameContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(userNameTitleLabel)
            make.leading.equalTo(userNameTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        genderPronounTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(userNameContentsButton.snp.bottom).offset(30)
        }
        genderPronounContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(genderPronounTitleLabel)
            make.leading.equalTo(genderPronounTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        introductionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(genderPronounTitleLabel.snp.bottom).offset(30)
        }
        introductionContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(introductionTitleLabel)
            make.leading.equalTo(introductionTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        linkTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(introductionTitleLabel.snp.bottom).offset(30)
        }
        linkContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(linkTitleLabel)
            make.leading.equalTo(linkTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        genderTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.top.equalTo(linkTitleLabel.snp.bottom).offset(30)
        }
        genderContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(genderTitleLabel)
            make.leading.equalTo(genderTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        switchToProfessionalAccountButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.top.equalTo(genderContentsButton.snp.bottom).offset(30)
        }
        setPrivacyInformationSettingButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.top.equalTo(switchToProfessionalAccountButton.snp.bottom).offset(30)
        }
    }
    

}
