//
//  NewSimpleCollectionViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/14.
//

import UIKit
import SnapKit

class NewSimpleViewModel {
    let list: Observable<[User]> = Observable([ ])
                

    let list2: Observable<[User]> = Observable( [User(name: "Hue", age: 6),
                User(name: "Jack", age: 1),
                User(name: "Bran", age: 2),
                User(name: "Kokojong", age: 28)
    ])
    
    func append() {
        list.value = [User(name: "Hue", age: 23),
                     User(name: "Jack", age: 21),
                     User(name: "Bran", age: 20),
                     User(name: "Kokojong", age: 0)
                     ]
    }
    
    func remove() {
        list.value = []
    }
    
    func removeUser(idx: Int) {
        list.value.remove(at: idx)
    }
    
    func insertUser(name: String) {
        let user = User(name: name, age: Int.random(in: 10...70))
        list.value.insert(user, at: Int.random(in: 0...2))
    }
}

class NewSimpleCollectionViewController: UIViewController {
    enum Section: Int,CaseIterable {
        case first = 2000
        case second = 1
    }

    var viewModel = NewSimpleViewModel()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
//    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell,User>!
    
    var dataSource: UICollectionViewDiffableDataSource<Section,User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
        updateSnapShot()
        
        viewModel.list.bind { user in
            self.updateSnapShot()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.list.insert(User(name: "뽀로로", age: 2), at: 2)
//            self.list.remove(at: 1)
//            self.updateSnapShot()
            self.viewModel.append()
        }
        
        
       
//
//        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//
//        collectionView.collectionViewLayout = layout
//
//
       

    }
    
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using:configuration)
        return layout
    }
    
    func updateSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,User>()
        
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(viewModel.list.value,toSection:.first)
        snapshot.appendItems(viewModel.list2.value,toSection: .second)
        
        dataSource.apply(snapshot)
    }
    
    private func configureDataSource() {
        //UICollectionView.CellRegistration : ios 14, 메서드 대신 제네릭을 사용, 셀이 생성될 때마다 클로저가 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(handler: { cell, indexPath, itemIdentifier in
            //셀 디자인 및 데이터 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(named:"star.fill")
            content.imageProperties.tintColor = .systemRed
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPink
            cell.backgroundConfiguration = backgroundConfig
            
        })
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        
    }
    
    
}

extension NewSimpleCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let user = viewModel.list.value[indexPath.item]
        guard let user = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        dump(user)
//        viewModel.removeUser(idx: indexPath.item)
    }
}

extension NewSimpleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text!)
    }
}
//
//extension NewSimpleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
//        return cell
//
//
//    }
//}
