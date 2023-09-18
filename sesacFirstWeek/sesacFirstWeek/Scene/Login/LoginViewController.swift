//
//  LoginViewController.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/07/19.
//

import UIKit
import SnapKit

enum TextFieldType: Int {
    case email = 100
    case password = 200
    case nickname = 300
}

class LoginViewController: UIViewController {
        let viewModel = LoginViewModel()
    
//    @IBOutlet var idTextField: UITextField!
//    @IBOutlet var emailTextField: UITextField!
//    @IBOutlet var passwordTextfield: UITextField!
//    @IBOutlet var locationTextField: UITextField!
//    @IBOutlet var codeTextField: UITextField!
//    @IBOutlet var infoSwitch: UISwitch!
//    @IBOutlet var registerButton: UIButton!
    let backgroundView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let logoLabel = {
        let view = UILabel()
        view.text = "JACKFLIX"
        view.font = UIFont.systemFont(ofSize: 30, weight: .black)
        view.textColor = .red
        return view
    }()
    
    let emailTextField = {
        let view = UITextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    let passwordTextField = {
        let view = UITextField()
        view.layer.cornerRadius = 15
        view.placeholder = "비밀번호"
        return view
    }()
    let nicknameTextField = {
        let view = UITextField()
        view.layer.cornerRadius = 15
        view.placeholder = "닉네임"
        return view
    }()
    let locationTextField = {
        let view = UITextField()
        view.layer.cornerRadius = 15
        view.placeholder = "위치"
        return view
    }()
    let codeTextField = {
        let view = UITextField()
        view.layer.cornerRadius = 15
        view.placeholder = "추천코드 입력"
        return view
    }()
    let resultLabel = {
        let view = UILabel()
        view.text = "alert"
        view.textColor = .red
        view.textAlignment = .center
        return view
    }()
    let registerButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        return view
    }()
    let extraInfoLabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        return view
    }()
    let infoSwitch = {
        let view = UISwitch()
        view.tintColor = .red
        return view
    }()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        designTextFields()
        setButtonStatus()
       
        designInfoSwitch(mySwitch: infoSwitch, isSetOn: false, animated: true, onTintColor: .red, thumbTintColor: .white)
        
        addTargets()
        bindData()
       
       
//        let testString = UserDefaults.standard.string(forKey: "testString")
//        let testInt = UserDefaults.standard.integer(forKey: "testInt")
//        let testBool = UserDefaults.standard.bool(forKey: "testBool")
//        print(testString,testInt,testBool)
//
//
//        let email = UserDefaults.standard.string(forKey: "email")
//        let password = UserDefaults.standard.string(forKey: "password")
//        let nickname = UserDefaults.standard.string(forKey: "nickname")
//
//
//        if let email {
//            emailTextField.text = email
//        }
//        if let password {
//            passwordTextField.text = password
//        }
//
//        if let nickname {
//            nicknameTextField.text = password
//        }
    
//        emailTextField.tag = TextFieldType.email.rawValue
//        passwordTextField.tag = TextFieldType.password.rawValue
//        nicknameTextField.tag = TextFieldType.nickname.rawValue
//
        
    }
    
    func bindData(){
        viewModel.nickname.bind{ text in
            self.nicknameTextField.text = text
            
        }
        viewModel.email.bind{ text in
            self.emailTextField.text = text
            
        }
        viewModel.pw.bind{ text in
            self.passwordTextField.text = text
            
        }
        viewModel.location.bind{ text in
            self.locationTextField.text = text
            
        }
        viewModel.invitationCode.bind{ text in
            self.codeTextField.text = text
            
        }
        
        viewModel.isValid.bind { bool in
            self.registerButton.isEnabled = bool
            self.registerButton.backgroundColor = bool ? .green : .lightGray
            
        }
        viewModel.validationResult.bind { value in
            self.resultLabel.text = value
        }
    }
    @objc func nicknameTextFieldChanged() {
        viewModel.nickname.value = nicknameTextField.text!
        viewModel.checkValidation()
    }
    @objc func emailTextFieldChanged() {
        viewModel.email.value = emailTextField.text!
        viewModel.checkValidation()
    }
    @objc func passwordTextFieldChanged() {
        viewModel.pw.value = passwordTextField.text!
        viewModel.checkValidation()
    }
    @objc func locationdTextFieldChanged() {
        viewModel.location.value = locationTextField.text!
        viewModel.checkValidation()
    }
    @objc func codeTextFieldChanged() {
        viewModel.invitationCode.value = codeTextField.text!
        viewModel.checkValidation()
    }
    
    
   
    
    func addTargets(){
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(locationdTextFieldChanged), for: .editingChanged)
        codeTextField.addTarget(self, action: #selector(codeTextFieldChanged), for: .editingChanged)
        
    }
    @objc func registerButtonTapped() {
        viewModel.signIn{ isRegistered,alert in
            switch isRegistered{
            case true:
                print("회원가입 완료")
            case false:
                print("회원가입 실패")
                print(alert)
            }
        
           
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    func setupConstraints(){
        [backgroundView,logoLabel,emailTextField,passwordTextField,nicknameTextField,locationTextField,codeTextField,registerButton,resultLabel,extraInfoLabel,infoSwitch].forEach{
            view.addSubview($0)
        }
        backgroundView.snp.makeConstraints { make in
            make.horizontalEdges.verticalEdges.equalToSuperview()
        }
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(logoLabel.snp.bottom).offset(80)
            make.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        locationTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        codeTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(locationTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        registerButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        extraInfoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        infoSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalTo(extraInfoLabel)
            make.height.equalTo(40)
        }
        
    }
//
//
//    @IBAction func saveButtonClicked(_ sender: Any) {
//
//        UserDefaults.standard.set(emailTextField.text!, forKey: "email")
//        UserDefaults.standard.set(passwordTextField.text!, forKey: "password")
//        UserDefaults.standard.set(nicknameTextField.text!, forKey: "nickname")
//        let previousCount = UserDefaults.standard.integer(forKey: "count")
//        UserDefaults.standard.set(previousCount+1, forKey: "count")
//        print("클릭했습니다.")
//        print(previousCount + 1)
//        view.backgroundColor = .red
//
//    }

//
//    @IBAction func loginViewClicked(_ sender: Any) {
//        view.endEditing(true)
//    }
    
 
    
//    @objc func textFieldKeyboardTapped(_ sender: UITextField) {

        
//        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag)  else {
//            print("오류가 발생했습니다")
//            return
//        }
//        guard let textfieldCase = TextFieldType(rawValue: sender.tag) else {
//            print("오류가 발생했습니다")
//            return
//        }
//        switch textfieldCase {
//        case .email : print("이메일은 \(text) 입니다.")
//        case .password : print("비밀번호는 \(text)")
//        case .nickname : print("아이디는 \(text) 입니다.")
//        }
//
//    }
    
    func setButtonStatus(){
        designButton(button: registerButton, title: "회원가입", titleColor: .black, backgroundColor: .white, status: .normal)
    }
    
    func designButton(button:UIButton,title:String, titleColor: UIColor,backgroundColor: UIColor,status: UIControl.State) {
        button.setTitle(title, for: status)
        button.setTitleColor(titleColor, for: status)
        button.backgroundColor = backgroundColor
        
    }
    
    func designTextFields() {
        designTextField(textField: emailTextField, placeholder: "이메일", textColor: .white, keyboardType: .default, isSecureTextEntry: false, textAlignment: .center, borderStyle: .line, backgroundColor: .gray)
        designTextField(textField: passwordTextField, placeholder: "비밀번호", textColor: .white, keyboardType: .default, isSecureTextEntry: false, textAlignment: .center, borderStyle: .line, backgroundColor: .gray)
        designTextField(textField: nicknameTextField, placeholder: "닉네임", textColor: .white, keyboardType: .default, isSecureTextEntry: false, textAlignment: .center, borderStyle: .line, backgroundColor: .gray)
        designTextField(textField: locationTextField, placeholder: "위치", textColor: .white, keyboardType: .default, isSecureTextEntry: false, textAlignment: .center, borderStyle: .line, backgroundColor: .gray)
        designTextField(textField: codeTextField, placeholder: "추천코드", textColor: .white, keyboardType: .default, isSecureTextEntry: false, textAlignment: .center, borderStyle: .line, backgroundColor: .gray)

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
