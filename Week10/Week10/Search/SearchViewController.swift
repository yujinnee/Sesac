//
//  SearchViewController.swift
//  Week10
//
//  Created by 이유진 on 2023/09/22.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let list = Array(0...100)
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionLayout())
    
    // 1)
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureHierarchy()
        configureLayout()
        configureDataSource()
    }

    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    static func configureCollectionLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(88))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, repeatingSubitem: item, count: 3)
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
            
    
//    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.scrollDirection = .vertical
//        return layout
//    }
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, Int> { cell, indexPath, itemIdentifier in
            
            cell.imageView.image = UIImage(systemName: "star.fill")
            cell.label.text = "\(itemIdentifier)번"
            cell.label.textAlignment = .center
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0]) // [1, 10, 100, 200]
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
        
    }
    
    
}


