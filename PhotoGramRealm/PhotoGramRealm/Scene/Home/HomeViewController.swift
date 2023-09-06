//
//  HomeViewController.swift
//  PhotoGramRealm
//
//  Created by jack on 2023/09/03.
//

import UIKit
import SnapKit
import RealmSwift

class HomeViewController: BaseViewController {
    //Realm Read
    let realm = try! Realm()
    var tasks: Results<DiaryTable>!
    let repository = DiaryTableRepository()
    
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 100
        view.delegate = self
        view.dataSource = self
        view.register(PhotoListTableViewCell.self, forCellReuseIdentifier: PhotoListTableViewCell.reuseIdentifier)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         tasks = realm.objects(DiaryTable.self).sorted(byKeyPath: "diaryTitle",ascending: true)
         */
        
        tasks = repository.fetch()
        
        repository.checkSchemaVersion()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func configure() {
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
        let filterButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterButtonClicked))
        let backupButton = UIBarButtonItem(title: "백업", style: .plain, target: self, action: #selector(backupButtonClicked))
        navigationItem.leftBarButtonItems = [sortButton, filterButton, backupButton]
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func plusButtonClicked() {
        navigationController?.pushViewController(AddViewController(), animated: true)
    }
    
    @objc func backupButtonClicked() {
        
    }
    
    
    @objc func sortButtonClicked() {
        
    }
    
    @objc func filterButtonClicked() {
        tasks = repository.fetchFilter()
        
        /*
         let result = realm.objects(DiaryTable.self).where {
         //대소문자 구별 없음 - caseInsensitive
         //            $0.diaryTitle.contains("제목", options: .caseInsensitive)
         
         //2. Bool
         //            $0.diaryLike == true
         
         //3. 사진이 있는 데이터만 불러오기(diaryPhoto의 nil 여부 판단)
         $0.diaryPhotoURL != nil
         }
         tasks = result
         */
        
        
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoListTableViewCell.reuseIdentifier) as? PhotoListTableViewCell else { return UITableViewCell() }
        
        let data = tasks[indexPath.row]
        
        cell.titleLabel.text = data.diaryTitle
        cell.contentLabel.text = data.contents
        cell.dateLabel.text = "\(data.diaryDate)"
        
        cell.diaryImageView.image = loadImageFromDocument(fileName: "jack_\(data._id).jpg")
        /*
        
        let value = URL(string: data.photo ?? "")
        //String -> Url -> Data -> UIImageView
        //셀에서 서버통신 중
        DispatchQueue.global().async {
            if let url = value, let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.diaryImageView.image = UIImage(data: data)
                }
            }
        }
         */
        
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.data = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
        //Realm Delete
        //        let data = tasks[indexPath.row]
        //        removeImageFromDocument(fileName: "jack_\(data._id).jpg")
        //        try! realm.write {
        //            realm.delete(data)
        //        }
        //
        //
        //
        //        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let like = UIContextualAction(style: .normal, title: "좋아여") { action, view, completionHandler in
            print("좋아여 선택됨")
        }
        like.backgroundColor = .orange
        
        switch tasks[indexPath.row].diaryLike{
        case true: like.image = UIImage(systemName: "star.fill")
        case false: like.image = UIImage(systemName: "star")
        }
        let sample = UIContextualAction(style: .normal, title: "테스트") { action, view, completionHandler in
            print("테스트 선택됨")
        }
        return UISwipeActionsConfiguration(actions: [like,sample])
    }
}


