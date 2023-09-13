//
//  LoginViewModel.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation

class LoginViewModel {
    
    var nickname = Observable("")
    var email = Observable("")
    var pw = Observable("")
    var isEmailValid = Observable(false)
    var isNicknameValid = Observable(false)
    var isPasswordValid = Observable(false)
    var isValid = Observable(false)
    func checkValidation() {
        if nickname.value.count >= 6 && nickname.value.count >= 6 && pw.value.count >= 6{
            isValid.value = true
        } else {
            isValid.value = false
        }
        
    }
    
    func signIn(completion: @escaping (Bool,String) -> Void) {
        if(!isNicknameValid.value){
            completion(false,"닉네임은 6글자 이상이어야 합니다.")
        }else if(!isEmailValid.value){
            completion(false,"이메일은 6글자 이상이어야 합니다.")
        }else if(!isPasswordValid.value){
            completion(false,"비밀번호는 6글자 이상이어야 합니다.")
        }else {
            UserDefaults.standard.set(nickname.value, forKey: "nickname")
            UserDefaults.standard.set(email.value, forKey: "email")
            UserDefaults.standard.set(pw.value, forKey: "password")
            completion(true,"로그인 성공")
        }
        
        
    }
}
