//
//  SimpleTableViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/14.
//

import UIKit

class NewSimpleTableViewController: UITableViewController {
    var list = [User(name: "Hue", age: 23),User(name: "Jack", age: 21),User(name: "Bran", age: 20),User(name: "Kokojong", age: 0)]
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = list[indexPath.row].name
        contentConfiguration.secondaryText = "\(list[indexPath.row].age)"
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
}
