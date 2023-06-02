//
//  LoginModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation



struct LoginDataModel   {
    var email: String = String()
    var password: String = String()
    var error: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
    var navigateSignup : Bool = true
    
    var buttonValidation : Bool {
        return ( email.isEmpty || password.isEmpty )
    }
    
    var buttonOpecity : Double {
        return buttonValidation ? 0.6 : 1.0
    }
    
   
}

struct LoginResponseData : Codable{
    let role : String
  //  let birthDate : String
    let email : String
    let name : String
    let gender : String
}

struct LoginRequest : Encodable {
    let email, password: String
}



struct UserResponse : Codable {
    let role : String
    let email : String
    let name : String
    let gender : String
}
