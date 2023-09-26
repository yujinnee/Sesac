//
//  SearchViewController.swift
//  Week10
//
//  Created by 이유진 on 2023/09/22.
//

import UIKit
import SnapKit
import Kingfisher

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let list = ["이모티콘이모티콘이모티콘","새싹이모티콘이모티콘","추석이모티콘","햄버거이모티콘이모티콘","컬렉션뷰이모티콘","고래밥이모티콘"]
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configurePinterestLayout())
    
    // 1)
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tableView = UITableView()
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = 50
        
        
        configureHierarchy()
        configureLayout()
        configureDataSource()
        
        let bar = UISearchBar()
        bar.delegate = self
        navigationItem.titleView = bar
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Network.shared.requestConvertible(type: Photo.self, api: .search(query: searchBar.text!)) { response in
            switch response{
            case .success(let success):
                //데이터 + UI스냅샷
                let ratios = success.results.map { Ratio(ratio: $0.width / $0.height)}
                let layout = PinterestLayout(columnsCount: 2, itemRatios: ratios, spacing: 10, contentWidth: self.view.frame.width)
               

                self.collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: layout.section)
                self.configureSnapShot(success)
               
        
                dump(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configureSnapShot(_ item: Photo) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0]) // [1, 10, 100, 200]
        snapshot.appendItems(item.results)
        dataSource.apply(snapshot)
    }
//    func configureSnapShot() {
//        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
//        snapshot.appendSections([0]) // [1, 10, 100, 200]
//        snapshot.appendItems(list)
//        dataSource.apply(snapshot)
//    }

    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, PhotoResult> { cell, indexPath, itemIdentifier in
            
           
            cell.imageView.kf.setImage(with: URL(string: itemIdentifier.urls.thumb)!)
            cell.label.text = "\(itemIdentifier.created_at)번"
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
    }

//    func configureDataSource() {
//
//        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, PhotoResult> { cell, indexPath, itemIdentifier in
//
//            cell.imageView.image = UIImage(systemName: "star.fill")
//            cell.label.text = "\(itemIdentifier)번"
//            cell.label.textAlignment = .center
//        }
//
//        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
//            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
//        })
//
//    }
    
    func configurePinterestLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(10))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(10))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, repeatingSubitem: item, count:2)
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
        section.interGroupSpacing = 10

        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        layout.configuration = configuration
        
        return layout
    }
    
    static func configureTagLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupsize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .absolute(30))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitems: [item])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
        section.interGroupSpacing = 10

        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        layout.configuration = configuration
        
        return layout
    }
         
//    static func configureCollectionLayout() -> UICollectionViewLayout {
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .fractionalHeight(1.0))
//
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupsize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .absolute(30))
//
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitems: [item])
//
//        group.interItemSpacing = .fixed(10)
//
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30)
//        section.interGroupSpacing = 10
//
//        let configuration = UICollectionViewCompositionalLayoutConfiguration()
//        configuration.scrollDirection = .vertical
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//
//        layout.configuration = configuration
//
//        return layout
//    }
//
    
//    static func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.scrollDirection = .vertical
//        return layout
//    }
    
   
    
    
}


