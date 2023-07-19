//
//  LoginViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var infoSwitch: UISwitch!
    @IBOutlet var registerButton: UIButton!
    
    @IBAction func loginViewClicked(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextFields()
        setButtonStatus()
        designInfoSwitch(mySwitch: infoSwitch, isSetOn: true, animated: true, onTintColor: .systemPink, thumbTintColor: .green)
    }
    
    func setButtonStatus(){
        designButton(button: registerButton, title: "회원가입", titleColor: .black, backgroundColor: .blue, status: .normal)
        designButton(button: registerButton, title: "회원가입하시겠어요?", titleColor: .red, backgroundColor: .blue, status: .highlighted)
    }
    
    func designButton(button:UIButton,title:String, titleColor: UIColor,backgroundColor: UIColor,status: UIControl.State) {
        button.setTitle(title, for: status)
        button.setTitleColor(titleColor, for: status)
        button.backgroundColor = backgroundColor
        
    }
    
    func designTextFields() {
        designTextField(textField: emailTextField, placeholder: "이메일 주소 또는 전화번호", textColor: .blue, keyboardType: .emailAddress, isSecureTextEntry: true, textAlignment: .center, borderStyle: .bezel, backgroundColor: .brown)
        designTextField(textField: passwordTextField, placeholder: "비밀번호", textColor: .yellow, keyboardType: .alphabet, isSecureTextEntry: true, textAlignment: .left, borderStyle: .line, backgroundColor: .white)
        designTextField(textField: nicknameTextField, placeholder: "닉네임", textColor: .systemPink, keyboardType: .twitter, isSecureTextEntry: true, textAlignment: .justified, borderStyle: .roundedRect, backgroundColor: .brown)
        designTextField(textField: locationTextField, placeholder: "위치", textColor: .cyan, keyboardType: .default, isSecureTextEntry: true, textAlignment: .right, borderStyle: .none, backgroundColor: .green)
        designTextField(textField: codeTextField, placeholder: "추천코드", textColor: .orange, keyboardType: .numberPad, isSecureTextEntry: true, textAlignment: .natural, borderStyle: .bezel, backgroundColor: .blue)
    }
    
    func designTextField(textField: UITextField,placeholder: String,textColor: UIColor,keyboardType: UIKeyboardType,isSecureTextEntry: Bool,textAlignment: NSTextAlignment,borderStyle: UITextField.BorderStyle, backgroundColor: UIColor)  {
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
        textField.textAlignment = textAlignment
        textField.borderStyle = borderStyle
        textField.backgroundColor = backgroundColor
        
    }
    
    func designInfoSwitch(mySwitch: UISwitch,isSetOn: Bool,animated:Bool,onTintColor: UIColor, thumbTintColor: UIColor){
        mySwitch.setOn(isSetOn, animated: animated)
        mySwitch.onTintColor = onTintColor
        mySwitch.thumbTintColor = thumbTintColor
    }
    
}
