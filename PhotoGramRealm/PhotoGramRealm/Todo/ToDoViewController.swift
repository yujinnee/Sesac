//
//  ToDoViewController.swift
//  PhotoGramRealm
//
//  Created by 이유진 on 2023/09/08.
//

import UIKit
import RealmSwift

class ToDoViewController: UIViewController {
    
    let realm = try! Realm()
    
    let tableView = UITableView()
    
    var list: Results<ToDoTable>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = ToDoTable(title:"영화보기",favorite: true)
        let memo = Memo()
        memo.content =  "주말에 팝콘 먹으면서 영화보기"
        memo.date = Date()
        
        try! realm.write{
            realm.add(data)
        }
        
        //        let data = ToDoTable(title: "장보기", favorite: true)
        //        let detail1 = DetailToDoTable(detail: "양파", deadline: Date())
        //        let detail2 = DetailToDoTable(detail: "사과", deadline: Date())
        //        let detail3 = DetailToDoTable(detail: "고구마", deadline: Date())
        //
        //        data.detail.append(detail1)
        //        data.detail.append(detail2)
        //        data.detail.append(detail3)
        //
        //        try! realm.write{
        //            realm.add(data)
        //        }
        //
        list = realm.objects(ToDoTable.self)
        
        print(realm.configuration.fileURL)
        
        print(list)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        
    }
    
    func createDetail() {
        let main = realm.objects(ToDoTable.self).where {
            $0.title == "장보기"
        }.first!
        
        
//        for i in 1...10 {
//            let detailTodo = DetailToDoTable(detail: "장보기 세부 할 일 \(i)", deadline: Date())
//
//            try! realm.write {
//                //                realm.add(detailTodo)
//                main.detail.append(detailTodo)
//            }
//        }
    }
    func createTodo() {
        
        for i in ["장보기","영화보기","리캡하기","좋아요구현하기","잠자기"] {
            let data = ToDoTable(title: i, favorite: false)
            
            try! realm.write {
                realm.add(data)
            }
        }
    }
}

extension ToDoViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")!
        
//        cell.textLabel?.text = "\(list[indexPath.row].title):\(list[indexPath.row].detail.count) \(list[indexPath.row].memo?.content)개"
        
        let data = list[indexPath.row]
      
//        cell.textLabel?.text = "\(data.detail) in \(data.mainTodo.first?.title ?? "")"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let data = list[indexPath.row]
//        
//        try! realm.write {
//            realm.delete(data.detail)
//            realm.delete(data)
//        }
//        
//        tableView.reloadData()
        
    }
    
}
