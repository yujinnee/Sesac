//
//  AttentionViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/09/25.
//

import UIKit
import SnapKit

struct Content: Hashable {
    let id = UUID().uuidString
    var systemIconName: String?
    var title: String
    var subTitle: String?
    var accessoryTitle: String?
    var iconColor: UIColor?
    var celltype: CellType
    
}
enum CellType{
    case basic
    case onnoff
}

class AttentionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 0
        case second = 1
    }
    let list = [
        Content(systemIconName: "moon.fill", title: "방해 금지 모드", accessoryTitle: "켬",iconColor: .blue, celltype: .basic),
        Content(systemIconName: "bed.double.fill", title: "수면", iconColor: .orange, celltype: .basic),
        Content(systemIconName: "iphone.gen1", title: "업무", subTitle: "09:00 ~ 06:00", iconColor: .green, celltype: .basic),
        Content(systemIconName: "person.fill", title: "개인 시간", accessoryTitle: "설정", iconColor: .blue, celltype: .basic),
    ]
    
    let list2 = [Content(title: "모든 기기에서 공유", celltype: .onnoff)]

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Section,Content>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Content>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(list,toSection: .first)
        snapshot.appendItems(list2,toSection: .second)
        
        dataSource.apply(snapshot)
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = true
        configuration.backgroundColor = .systemGray6
//        configuration.headerMode = .supplementary
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Content> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.color = .black
            content.secondaryText = itemIdentifier.subTitle
            if let image = itemIdentifier.systemIconName{
                content.image = UIImage(systemName: image)
            }
            
           
            content.imageProperties.tintColor = itemIdentifier.iconColor
            content.prefersSideBySideTextAndSecondaryText = false
            
            cell.contentConfiguration = content
            
          
          
            switch itemIdentifier.celltype{
            case .basic:
                let accessoryView = UILabel()
                accessoryView.text = itemIdentifier.accessoryTitle
                cell.accessories = [.disclosureIndicator(), .customView(configuration: .init(customView: accessoryView, placement: .trailing()))]
            case .onnoff:
                let accessoryView = UISwitch()
                cell.accessories = [.disclosureIndicator(), .customView(configuration: .init(customView: accessoryView, placement: .trailing()))]
                
            }
            
  
            
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .white
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 0
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
}
