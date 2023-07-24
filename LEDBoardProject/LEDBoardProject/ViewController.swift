//
//  ViewController.swift
//  LEDBoardProject
//
//  Created by 이유진 on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var colorButton: UIButton!
    
    @IBOutlet var controlView: UIView!
    @IBOutlet var ledLabel: UILabel!
    @IBAction func sendButtonTapped(_ sender: Any) {
        ledLabel.text = wordTextField.text
    }
    @IBAction func colorButtonTapped(_ sender: Any) {
        setLEDColor()
    }
    @IBAction func rootViewTapped(_ sender: Any) {
        self.view.endEditing(true)
        controlView.isHidden = !controlView.isHidden
        
    }
    @IBAction func returnKeyTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initLEDLabel()
        setLEDColor()
        designControl()
        
    }
    func initLEDLabel(){
        ledLabel.text = ""
        designLEDLabel()
    }
    func designLEDLabel(){
        ledLabel.font = UIFont.systemFont(ofSize: 150)
        setLEDColor()
    }
    func setLEDColor(){
        backgroundView.backgroundColor = pickRandomColor()
        ledLabel.textColor = pickRandomColor()
    }
    func pickRandomColor()->UIColor{
        let redNum = CGFloat.random(in: 0...1)
        let greenNum = CGFloat.random(in: 0...1)
        let blueNum = CGFloat.random(in: 0...1)
        return UIColor(red: redNum, green: greenNum, blue: blueNum, alpha: 1)
    }
    func designControl(){
        controlView.layer.cornerRadius = 10
        sendButton.setTitle("보내기", for: .normal)
        sendButton.layer.borderColor = UIColor.black.cgColor
        sendButton.layer.borderWidth = 2
        sendButton.layer.cornerRadius = 10
        colorButton.setTitle("Aa", for: .normal)
        colorButton.tintColor = .red
        colorButton.layer.borderColor = UIColor.black.cgColor
        colorButton.layer.borderWidth = 2
        colorButton.layer.cornerRadius = 10
    }


}

