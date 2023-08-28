//
//  SearchView.swift
//  SeSAC3PhotoGram
//
//  Created by 이유진 on 2023/08/28.
//

import UIKit

class SearchView: BaseView {
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()
    
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.collectionViewLayout = collectionViewLayout()
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        return view
    }()

    override func configureView() {
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        print("dd")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size/4, height: size/4)
        return layout
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }

    }

}
