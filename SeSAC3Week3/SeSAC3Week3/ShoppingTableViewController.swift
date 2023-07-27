//
//  ShoppingTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    var shoppingList = ["그립톡 구매하기","사이다 구매","아이패드 케이스 최저가 알아보기","양말"]

    @IBOutlet var textFieldView: UIView!
    @IBOutlet var shoppingTextField: UITextField!
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let text = shoppingTextField.text ?? ""
        shoppingList.append(text)
        print("tapped")
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
        return shoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell")!
        cell.textLabel?.text = shoppingList[indexPath.row]
        let image = UIImage(systemName: "star")
        cell.accessoryView = UIImageView(image: image)
        cell.separatorInset = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
        cell.layer.cornerRadius = 10
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
