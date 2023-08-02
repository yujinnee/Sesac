//
//  CustomTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit



class CustomTableViewController: UITableViewController {
    
    var todo = ToDoInformation() {
        didSet{
            print("Didset")
            tableView.reloadData()
        }
    }

    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "할일을 입력해보세요"
        searchBar.searchTextField.addTarget(self, action: #selector(searchBarReturnTapped), for: .editingDidEndOnExit)
    }
    @objc func searchBarReturnTapped() {
        let data = ToDo(main: searchBar.text!, sub: "23.08.01", like: false, done: false,color:ToDoInformation.randomBackgroundColor())
        todo.list.insert(data,at:0)
        searchBar.text = ""
//        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let row = todo.list[indexPath.row]
        cell.configureCell(row: row)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        return cell
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        print("clicked\(sender.tag)")
        todo.list[sender.tag].like.toggle()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.data = todo.list[indexPath.row]
        present(vc,animated: true)
        tableView.reloadRows(at: [indexPath], with: .none)
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todo.list.remove(at: indexPath.row)
//        tableView.reloadData()
    }

}
