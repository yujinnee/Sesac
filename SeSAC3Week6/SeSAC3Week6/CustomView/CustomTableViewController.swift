//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by 이유진 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample{
    let text: String
    var isExpand: Bool

}

class CustomTableViewController: UIViewController {
    var list = [
        Sample(text: "테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트", isExpand: false),
        Sample(text: "테스트 셀 ", isExpand: false),
        Sample(text: "테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트", isExpand: false)
    ]
    
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self
        view.dataSource = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        print(#function)
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalToSuperview()
            print(#function)
        }
       
    }

}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0:2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list[indexPath.row].isExpand.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
