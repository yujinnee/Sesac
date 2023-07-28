//
//  StudyTableViewController.swift
//  SeSAC3Week3
//
//  Created by 이유진 on 2023/07/27.
//

import UIKit

class StudyTableViewController: UITableViewController {
    
    let studyList = ["변수","상수","열거형","옵셔널 바인딩", "메서드", "프로퍼티"]
    let appleList = ["아이폰","아이패드","애플워치","에어팟"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "첫번째 섹션" : "두번째 섹션"
    }

    //1. 셀 갯수 (필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? studyList.count : appleList.count
        
    }
    
    //2. 셀 데이터 및 디자인 처리 (필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")!
        if indexPath.section == 0 {
            cell.textLabel?.text = studyList[indexPath.row]
            cell.detailTextLabel?.text = "제목"
            
        }else {
            cell.textLabel?.text = appleList[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 60
    }
    
    

}
