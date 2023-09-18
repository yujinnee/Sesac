//
//  LoginViewModel.swift
//  sesacFirstWeek
//
//  Created by 이유진 on 2023/09/13.
//

import Foundation

class LoginViewModel {
    
    var email: Observable<String?> =  Observable("")
    var pw : Observable<String?> = Observable("")
    var nickname : Observable<String?> = Observable("")
    var location : Observable<String?> = Observable("")
    var invitationCode : Observable<String?> = Observable("")
    var isEmailValid = Observable(false)
    var isNicknameValid = Observable(false)
    var isPasswordValid = Observable(false)
    var isValid = Observable(false)
    var validationResult = Observable("")
    func checkValidation() {
//        if nickname.value.count >= 6 && nickname.value.count >= 6 && pw.value.count >= 6{
//            isValid.value = true
//        } else {
//            isValid.value = false
//        }
        guard email.value?.count ?? 0 > 0 else{
            validationResult.value = "이메일을 입력해주세요"
            isValid.value = false
            return
        }
//        let emailRegex = /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,}/
//        guard ((email.value?.matches(of: emailRegex)) != nil) else {
        guard email.value!.contains("@") else {
            validationResult.value = "이메일 형식이 아닙니다."
            isValid.value = false
            return
        }
        guard pw.value?.count ?? 0 > 0 else{
            validationResult.value = "비밀번호를 입력해주세요"
            isValid.value = false
            return
        }
//        let pwRegex = /[A-Za-z0-9!_@$%^&+=]{6,10}/
//        guard pw.value?.matches(of: pwRegex) != nil else {
//            validationResult.value = "비밀번호는 영문 대문자, 소문자, 숫자, 특수문자만 허용하며 6~10자 사이 입니다."
//            isValid.value = false
//            return
//        }
        guard 6...10 ~= pw.value!.count else {
            validationResult.value = "비밀번호는 6~10자 사이입니다."
            isValid.value = false
            return
        }
        guard nickname.value?.count ?? 0 > 0 else{
            validationResult.value = "닉네임을 입력해주세요"
            isValid.value = false
            return
        }
        guard location.value?.count ?? 0 > 0 else{
            validationResult.value = "위치정보를 입력해주세요"
            isValid.value = false
            return
        }
    
        guard invitationCode.value?.count ?? 0 == 6 else {
            validationResult.value = "추천코드는 6글자 입니다."
            isValid.value = false
            return
        }
        
        validationResult.value = ""
        isValid.value = true
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
