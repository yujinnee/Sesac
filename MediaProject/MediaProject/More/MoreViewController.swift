//
//  MoreViewController.swift
//  MediaProject
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit

enum SegmentType: String{
    case similar = "similar"
    case videos = "videos"
}

class MoreViewController: BaseViewController {
    var id = 0
    private var similarList = [SimilarVideo]()
    private var videosList = [VideosVideo]()
    private var segmentType = SegmentType.similar
    
    @IBOutlet var moreCollectionView: UICollectionView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func segementedValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            segmentType = .similar
            moreCollectionView.reloadData()
        case 1:
            segmentType = .videos
            moreCollectionView.reloadData()
        default:
            segmentType = .similar
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setMoreCollectionView()
        setSegmentedControl()
        requestData()
    }
    private func requestData(){
        let group = DispatchGroup()
        group.enter()
        requestSimilarData(group: group)
        group.enter()
        requestVideosData(group: group)
        group.notify(queue: .main){
            print("END")
            self.moreCollectionView.reloadData()
        }
    }
    private func requestSimilarData(group: DispatchGroup){
        TMDBManager.shared.callSimilarRequest(id: id){ data in
            self.similarList = data
            group.leave()
            
        }
    }
    private func requestVideosData(group: DispatchGroup){
        TMDBManager.shared.callVideosRequest(id: id){ data in
            self.videosList = data
            group.leave()
            
        }
        
    }
    
    private func setSegmentedControl(){
        segmentedControl.setTitle(SegmentType.similar.rawValue, forSegmentAt: 0)
        segmentedControl.setTitle(SegmentType.videos.rawValue, forSegmentAt: 1)
        
    }
    
    private func setMoreCollectionView(){
        moreCollectionView.register(UINib(nibName: MoreCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MoreCollectionViewCell.identifier)
        moreCollectionView.dataSource = self
        moreCollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        moreCollectionView.collectionViewLayout = layout
        
    }
    
}

extension MoreViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmentType{
        case .similar: return similarList.count
        case .videos: return videosList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moreCollectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell else {return UICollectionViewCell()}
        switch segmentType{
        case .similar:
            cell.setData(data: similarList[indexPath.row])
        case .videos:
            cell.setData(data:videosList[indexPath.row])
        }
        return cell
    }
    
    
}
