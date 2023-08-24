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
    
    let tableView = {
        let view = UITableView()
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
       
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
