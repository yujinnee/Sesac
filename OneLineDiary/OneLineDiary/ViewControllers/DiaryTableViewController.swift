//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by 이유진 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1","테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2","테스트3테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DiaryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension

    }
    @IBAction func searchBarButtonItemClicked(_ sender : Any){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addBarButtonItemClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalTransitionStyle = .partialCurl //모달 애니메이션
        nav.modalPresentationStyle = .fullScreen //모달 방식
        present(nav, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        "DiaryTableViewCell") as? DiaryTableViewCell else { return UITableViewCell()}
        cell.contentLabel.numberOfLines = 0
        cell.configure(text: list[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.contents = "Diary 뷰컨트롤러에서 데이터 전달하면서 화면전환하기! "
        vc.contents = list[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
 /*
    //Custom Swipe
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
    }
    //Custom Swipe
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        <#code#>
    }
*/
}
