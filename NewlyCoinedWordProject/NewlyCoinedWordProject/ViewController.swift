//
//  ViewController.swift
//  NewlyCoinedWordProject
//
//  Created by 이유진 on 2023/07/23.
//

import UIKit

class ViewController: UIViewController {
    let newlyCoinedWordList = ["폼 미쳤다":"무언가 범상치 않다는 의미","억텐":"억지텐션의 줄임말","스불재":"스스로 불러온 재앙의 줄임말","점메추":"점심메뉴추천의 줄임말","군싹":"군침이 싹 도네의 줄임말","킹받다":"열받는다는 뜻"]
    
    @IBOutlet var tagButton1: UIButton!
    @IBOutlet var tagButton2: UIButton!
    @IBOutlet var tagButton3: UIButton!
    @IBOutlet var tagButton4: UIButton!
    @IBOutlet var tagButton5: UIButton!
    @IBOutlet var tagButton6: UIButton!
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var meaningLabel: UILabel!
    
    @IBAction func rootViewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(false)
    }
    @IBAction func tagButtonClicked(_ sender: UIButton) {
        var index = sender.tag
        showMeaning(index: index)
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        searchTextFieldWord()
    }
    @IBAction func searchTextFieldDidEndOnExit(_ sender: UITextField) {
        searchTextFieldWord()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initWordMeaningLabel()
        designTagButtons()
        setTagText()
    }
    func initWordMeaningLabel() {
        meaningLabel.text = ""
    }
    func designTagButtons(){
        for i in 1...6{
            let button = self.view.viewWithTag(i) as! UIButton
            designTagButton(button: button)
        }
    }
    func setTagText() {
        var words = [String](newlyCoinedWordList.keys)
        for i in 1...6{
            let button = self.view.viewWithTag(i) as! UIButton
            button.setTitle(words[i-1], for: .normal)
        }
    }
    func searchTextFieldWord(){
        if let word = searchTextField.text{
            if word.count == 1{
                let alert = UIAlertController(title: "미완성 단어", message: "두 글자 이상 입력해주세요", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                present(alert, animated: true)
                return
            }
            if let searchedMeaning = newlyCoinedWordList[word]{
                meaningLabel.text = searchedMeaning
                searchTextField.text = " "
            }else{
                let alert = UIAlertController(title: "찾을 수 없는 단어", message: "다른 단어를 입력해주세요", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "잘못된 입력", message: "빈칸 입니다. 단어를 입력해주세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    func showMeaning(index: Int) {
        var words = [String](newlyCoinedWordList.keys)
        meaningLabel.text = newlyCoinedWordList[words[index-1]]
    }
    func designTagButton(button: UIButton){
        button.tintColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0)
        button.configuration = config
    }
}

