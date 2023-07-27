
//  TodoTableTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/27.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    @IBOutlet var todoTableView: UITableView!
    var list = ["장보기","영화보기","잠자기","코드보기"]

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        list.append("숨쉬기")
        todoTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textColor = .red
        cell.textLabel?.font = .boldSystemFont(ofSize: 28)
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .blue
        cell.detailTextLabel?.font = .systemFont(ofSize: 15)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
