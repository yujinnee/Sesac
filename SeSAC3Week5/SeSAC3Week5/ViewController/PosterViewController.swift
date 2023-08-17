//
//  PosterViewController.swift
//  SeSAC3Week5
//
//  Created by 이유진 on 2023/08/16.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher


protocol CollectionViewAttributeProtocol{
    func configureCollectionView()
    func configureCollectionViewLayout()
}

class PosterViewController: UIViewController {
    var list: Recommendation = Recommendation(totalPages: 0, page: 0, totalResults: 0, results: [])
    var secondList: Recommendation = Recommendation(totalPages: 0, page: 0, totalResults: 0, results: [])
    
    @IBOutlet var posterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        LottoManager.shared.callLotto{bonus,number in
//            print("클로저로 꺼내온 값: \(bonus),\(number)")
//        }
        
        callRecommendation(id: 671){ data in
            self.list = data
//            self.posterCollectionView.reloadData()
            
        }
        callRecommendation(id: 479718){ data in
            self.secondList = data
            self.posterCollectionView.reloadData()
        }
        
        configureCollectionView()
        configureCollectionViewLayout()
        
    }
    
    func callRecommendation(id: Int, completionHandler: @escaping (Recommendation) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(APIKey.tmdb)&language=ko-KR"
        
        AF.request(url,method: .get).validate(statusCode: 200...500)
            .responseJSON{ response in
                switch response.result {
                case .success(let value):
                    print("제이쓴")
                    print(JSON(value))
                    
//                    self.list = value
//                    print(self.list)
                case .failure(let error):
                    print(error)
                }

        }

        AF.request(url,method: .get).validate(statusCode: 200...500)
            .responseDecodable(of:Recommendation.self){ response in
                switch response.result {
                case .success(let value):
                
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }

        }

            
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert(title: "테스트 얼럿", message: "메세지 입니다", button:"배경색 변경"){
            print("저장 버튼을 클릭 했습니다.")
            self.posterCollectionView.backgroundColor = .lightGray
        }
    }
    func callLotto() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
        AF.request(url, method: .get).validate()
            .responseDecodable(of: Lotto.self) { response in
                guard let value = response.value else { return }
                print("responseDecodable:", value)
            }
    }
    
    
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return list.results.count
        } else if section == 1{
            return secondList.results.count
        }else {
            return 9
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(list.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        }else if indexPath.section == 1{
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(secondList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        }
        
        cell.posterImageView.backgroundColor = UIColor(red:CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderPosterCollectionReusableView", for: indexPath) as? HeaderPosterCollectionReusableView else { return UICollectionReusableView() }
            
            view.titleLabel.text = "테스트 섹션\(indexPath.section)"
            return view
            
        } else {
            return UICollectionReusableView()
        }
    }
    
}


extension PosterViewController: CollectionViewAttributeProtocol{
    func configureCollectionView() {
        //Protocol as Type
        posterCollectionView.delegate = self
        posterCollectionView.dataSource = self
        
        posterCollectionView.register(UINib(nibName: PosterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        
        posterCollectionView.register(UINib(nibName: HeaderPosterCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier)
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 300, height: 50)
        
        posterCollectionView.collectionViewLayout = layout
        
    }

}


