//
//  TimelineViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/08/02.
//

import UIKit

class TimelineViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var todayCollectionView: UICollectionView!
    
    @IBOutlet var bestCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        let nib = UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil)
        todayCollectionView.register(nib, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        bestCollectionView.register(nib, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        configureBestCollectionViewLayout()
        configureBestCollectionViewLayout()

    }
    func configureTodayCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        todayCollectionView.collectionViewLayout = layout
    }
    func configureBestCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        bestCollectionView.collectionViewLayout = layout
//        bestCollectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == todayCollectionView ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath ) as! SearchCollectionViewCell
        
        if collectionView == todayCollectionView{
            cell.contentsLabel.text = "Today: \(indexPath.item)"
            cell.backgroundColor = .systemPink
        }else {
            cell.contentsLabel.text = "Best: \(indexPath.item)"
            cell.backgroundColor = indexPath.row%2 == 0 ? .yellow : .green
        }
        
        return cell
    }
    


}
