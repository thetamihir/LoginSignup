//
//  LoginModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation

struct LoginResponse: Decodable {
    let error: Bool
    let message : String
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let role : String
  //  let birthDate : String
    let email : String
    let name : String
    let gender : String
}

struct LoginRequest : Encodable {
    let email, password: String
}


struct LoginDataModel   {
    var email: String = String()
    var password: String = String()
    var error: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}
