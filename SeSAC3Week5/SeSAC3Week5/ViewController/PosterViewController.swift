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
    var thirdList: Recommendation = Recommendation(totalPages: 0, page: 0, totalResults: 0, results: [])
    var fourthList: Recommendation = Recommendation(totalPages: 0, page: 0, totalResults: 0, results: [])
    
    @IBOutlet var posterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureCollectionView()
        configureCollectionViewLayout()
        
//
//        let id = [673,674,675,675]
//
//        let group = DispatchGroup()
//
//        for item in id {
//            group.enter()
//            callRecommendation(id: item) { data in
//                group.leave()
//            }
//        }
//        group.notify(queue:.main) {
//            self.posterCollectionView.reloadData()
//        }
        

        
        //포그라운드에서 알림이 안뜨는게 디폴트
        
        let content = UNMutableNotificationContent()
        content.title = "viewdidload다마고치에게 물을 주세요"
        content.body = "아직 레벨 3이에요. 물을 주세요!!"
        content.badge = 100
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){ error in
            print(error)
        }
        
    }
    
    func callRecommendation(id: Int, completionHandler: @escaping (Recommendation) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(APIKey.tmdb)&language=ko-KR"
        
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
    func dispatchGroupEnterLeave() {
        let group = DispatchGroup()
        
        group.enter() // +1
        callRecommendation(id: 671){ data in
            self.list = data
            self.posterCollectionView.reloadData()
            print("===1===")
            group.leave() // -1
        }
        group.enter() // +1
        callRecommendation(id: 479718){ data in
            self.secondList = data
            self.posterCollectionView.reloadData()
            print("===2===")
            group.leave() // -1
        }
        group.enter() // +1
        callRecommendation(id: 204553){ data in
            self.thirdList = data
            self.posterCollectionView.reloadData()
            print("===3===")
            group.leave() // -1
        }
        group.enter() // +1
        callRecommendation(id: 825){ data in
            self.fourthList = data
            self.posterCollectionView.reloadData()
            print("===4===")
            group.leave() // -1
        }
        group.notify(queue: .main){
            print("END")
            self.posterCollectionView.reloadData()
        }
        
    }
    func dispatchGroupNotify() {
        
        let group = DispatchGroup()
       
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 671){ data in
                self.list = data
                self.posterCollectionView.reloadData()
                print("===1===")
                
            }
        }
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 479718){ data in
                self.secondList = data
                self.posterCollectionView.reloadData()
                print("===2===")
              
            }
        }
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 204553){ data in
                self.thirdList = data
                self.posterCollectionView.reloadData()
                print("===3===")
              
            }
        }
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 825){ data in
                self.fourthList = data
                self.posterCollectionView.reloadData()
                print("===4===")
            }
        }
        group.notify(queue: .main){
            print("END")
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
    
    @IBAction func sendNotification(_ sender: UIButton) {
        print("tapped")
        
        //포그라운드에서 알림이 안뜨는게 디폴트
        
//        let content = UNMutableNotificationContent()
//        content.title = "111111111다마고치에게 물을 주세요"
//        content.body = "아직 레벨 3이에요. 물을 주세요!!"
//        content.badge = 100
        
        let content = UNMutableNotificationContent()
        content.title = "알림 알림 알림"
        content.body = ["5초 뒤에 알림 받기","Asd","Asdf"].randomElement()!
        content.badge = 100
        
        var component = DateComponents()
        component.minute = 5
        component.hour = 10
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){ error in
            print(error)
        }
    }
    
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0: return list.results.count
        case 1: return secondList.results.count
        case 2: return thirdList.results.count
        case 3: return fourthList.results.count
        default : return 9
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.section{
        case 0:
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(list.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        case 1:
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(secondList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        case 2:
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(thirdList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        case 3:
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(fourthList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        default:
            let url = "https://www.themoviedb.org/t/p/w220_and_h330_face\(list.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
            
        }
        cell.posterImageView.backgroundColor = UIColor(red:CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderPosterCollectionReusableView", for: indexPath) as? HeaderPosterCollectionReusableView else { return UICollectionReusableView() }
            
            view.titleLabel.text = "테스트 섹션\(indexPath.section)"
            view.titleLabel.font = UIFont(name: "GmarketSansTTFBold", size: 20)
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


