//
//  TrendView.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/29.
//

import UIKit

class TrendView: BaseView {

    lazy var trendVideoTableView = {
        let view = UITableView(frame: .zero)
        view.register(UINib(nibName: TrendMovieTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TrendMovieTableViewCell.identifier)
        return view
    }()
    
    override func configureView() {
        
    }
    
    override func setConstraints() {
        self.addSubview(trendVideoTableView)
        trendVideoTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

}
