//
//  DetailView.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class DetailView: BaseView {
 
    
    let moreButton = {
        let view = UIButton()
        view.tintColor = .systemIndigo
        return view
    }()
    let titleLabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return view
    }()
    let posterImageView = {
        let view = UIImageView()
        return view
    }()
    let backdropImageView = {
        let view = UIImageView()
        return view
    }()
    let overviewHeaderLabel = {
        let view = UILabel()
        view.text = "Overview"
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    let overviewLabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.numberOfLines = 0
        return view
    }()
    let castHeaderLabel = {
        let view = UILabel()
        view.text = "Cast"
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    let castTableView = {
        let view = UITableView()
        view.register(UINib(nibName: PersonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.identifier)
        view.rowHeight = 120
        return view
    }()
    
    override func setConstraints() {
        addSubview(backdropImageView)
        backdropImageView.addSubview(titleLabel)
        backdropImageView.addSubview(posterImageView)
        
        addSubview(overviewHeaderLabel)
        addSubview(moreButton)
        addSubview(overviewLabel)
        addSubview(castHeaderLabel)
        addSubview(castTableView)
        backdropImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.bottom.equalToSuperview().inset(16)
            make.width.equalTo(posterImageView.snp.height).multipliedBy(1/1.3)
        }
        overviewHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(backdropImageView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(overviewHeaderLabel)
            make.trailing.equalToSuperview().inset(16)
        }
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(moreButton.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
        castHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            
        }
        castTableView.snp.makeConstraints { make in
            make.top.equalTo(castHeaderLabel.snp.bottom).offset(16)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
    }

}
