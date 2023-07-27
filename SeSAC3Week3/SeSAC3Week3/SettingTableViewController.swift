//
//  SettingTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/28.
//

import UIKit

class SettingTableViewController: UITableViewController {
    let allSettingList = ["공지사항","실험실","버전 정보"]
    let personalSettingList = ["개인/보안","알림","채팅","멀티 프로필"]
    let etcSettingList = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 3
        case 1: return 4
        case 2: return 1
        default: return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingContentsCell", for: indexPath)
        
        switch indexPath.section{
        case 0: cell.textLabel?.text = allSettingList[indexPath.row]
        case 1: cell.textLabel?.text = personalSettingList[indexPath.row]
        case 2: cell.textLabel?.text = etcSettingList[indexPath.row]
        default: cell.textLabel?.text = allSettingList[indexPath.row]
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "전체 설정"
        case 1: return "개인 설정"
        case 2: return "기타"
        default: return "헤더"
        }
    }

}
