//
//  SampleViewController.swift
//  UnsplashProject
//
//  Created by 이유진 on 2023/09/12.
//

import UIKit

struct User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let name: String
    let age: Int
    
    let id = UUID().uuidString
    
    var introduce: String {
        return "\(name),\(age)살"
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class SampleViewController: UIViewController {
    

    @IBOutlet var tableView: UITableView!
    
    let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var number1 = 10
        var number2 = 3
        
        print(number1-number2)
        
        number1 = 3
        number2 = 1
        
//        var number3 = Observable(value: 10)
//        var number4 = Observable(value: 3)
        
//        number3.bind{ number in
//            print("Observable",number3.value - number4.value)
//        }
//        
//        number3.value = 100
//        number3.value = 500
//        number3.value = 50
//        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
}

extension SampleViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell")!
//        let data = viewModel.cellForRowAt(at: indexPath)
//        cell.textLabel?.text = "\(data.name),\(data.age) 살"
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "테스트" //textLabel
        content.secondaryText = "안녕하세요 \(indexPath.row)" //detailTextLabel
        cell.contentConfiguration = content
        
        return cell
    }
}
