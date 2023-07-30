//
//  ShoppingTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    var shoppingData = ShoppingData()
    
    @IBOutlet var textFieldView: UIView!
    @IBOutlet var shoppingTextField: UITextField!
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let text = shoppingTextField.text ?? ""
        let item = ShoppingItem(name: text, isChecked: false, isLiked: false)
        shoppingData.shoppingList.append(item)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextFieldView()
    }
    func designTextFieldView(){
        textFieldView.layer.cornerRadius = 10
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingData.shoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var idx = indexPath.row
        var item = shoppingData.shoppingList[idx]
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as! ShoppingTableViewCell
        cell.configure(item: item,idx:idx)
        cell.delegate = self
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shoppingData.shoppingList[indexPath.row].isChecked.toggle()
        tableView.reloadData()
    }
}
extension ShoppingTableViewController: likeButtonTappedDelegate{
    func likeButtonTapped(idx:Int) {
        shoppingData.shoppingList[idx].isLiked.toggle()
        tableView.reloadData()
    }
}
