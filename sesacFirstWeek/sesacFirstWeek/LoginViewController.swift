//
//  LoginViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit

enum TextFieldType: Int {
    case id = 100
    case email = 200
    case password = 300
}

class LoginViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    @IBOutlet var infoSwitch: UISwitch!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextFields()
        setButtonStatus()
        designInfoSwitch(mySwitch: infoSwitch, isSetOn: true, animated: true, onTintColor: .systemPink, thumbTintColor: .green)
        
        let testString = UserDefaults.standard.string(forKey: "testString")
        let testInt = UserDefaults.standard.integer(forKey: "testInt")
        let testBool = UserDefaults.standard.bool(forKey: "testBool")
        print(testString,testInt,testBool)
        
        let name = UserDefaults.standard.string(forKey: "id")
        let email = UserDefaults.standard.string(forKey: "email")
        let password = UserDefaults.standard.string(forKey: "password")
        
        
        if let name {
            idTextField.text = name
        }
        if let email {
            emailTextField.text = email
        }
        
        if let password {
            passwordTextfield.text = password
        }
        
        
        
        idTextField.tag = TextFieldType.id.rawValue
        emailTextField.tag = TextFieldType.email.rawValue
        passwordTextfield.tag = TextFieldType.password.rawValue
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(idTextField.text!, forKey: "id")
        UserDefaults.standard.set(emailTextField.text!, forKey: "email")
        UserDefaults.standard.set(passwordTextfield.text!, forKey: "password")
        
        let previousCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(previousCount+1, forKey: "count")
        
        
    }

    
    @IBAction func loginViewClicked(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag)  else {
            print("오류가 발생했습니다")
            return
        }
        guard let textfieldCase = TextFieldType(rawValue: sender.tag) else {
            print("오류가 발생했습니다")
            return
        }
        switch textfieldCase {
        case .id : print("아이디는 \(text) 입니다.")
        case .email : print("이메일은 \(text) 입니다.")
        case .password : print("비밀번호는 \(text)")
        }
        
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
        designTextField(textField: idTextField, placeholder: "아이디", textColor: .blue, keyboardType: .emailAddress, isSecureTextEntry: false, textAlignment: .center, borderStyle: .bezel, backgroundColor: .brown)
        designTextField(textField: emailTextField, placeholder: "이메일", textColor: .yellow, keyboardType: .alphabet, isSecureTextEntry: false, textAlignment: .left, borderStyle: .line, backgroundColor: .white)
        designTextField(textField: passwordTextfield, placeholder: "비밀번호", textColor: .systemPink, keyboardType: .default, isSecureTextEntry: false, textAlignment: .justified, borderStyle: .roundedRect, backgroundColor: .brown)
        designTextField(textField: locationTextField, placeholder: "위치", textColor: .cyan, keyboardType: .default, isSecureTextEntry: false, textAlignment: .right, borderStyle: .none, backgroundColor: .green)
        designTextField(textField: codeTextField, placeholder: "추천코드", textColor: .orange, keyboardType: .numberPad, isSecureTextEntry: false, textAlignment: .natural, borderStyle: .bezel, backgroundColor: .blue)
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
