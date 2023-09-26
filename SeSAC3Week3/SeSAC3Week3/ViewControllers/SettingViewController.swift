//
//  SettingViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/09/25.
//

import UIKit
import SnapKit

class SettingContent: Hashable {
    static func == (lhs: SettingContent, rhs: SettingContent) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
    let id = UUID().uuidString
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
}

class SettingViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 0
        case second = 1
        case third = 2
    }
    let list1 = [
        SettingContent(title: "공지사항"),
        SettingContent(title: "실험실"),
        SettingContent(title: "버전 정보")
    ]
    
    let list2 = [
        SettingContent(title: "개인/보안"),
        SettingContent(title: "알림"),
        SettingContent(title: "채팅"),
        SettingContent(title: "멀티 프로필")
        
    ]
    
    let list3 = [
        SettingContent(title: "고객센터/도움말")
    ]
    

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Section,SettingContent>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,SettingContent>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(list1,toSection: .first)
        snapshot.appendItems(list2,toSection: .second)
        snapshot.appendItems(list3,toSection: .third)
        
        dataSource.apply(snapshot)
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = true
        configuration.separatorConfiguration.color = .white
        configuration.backgroundColor = .black
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SettingContent> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.color = .white
            cell.contentConfiguration = content
            
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
}
