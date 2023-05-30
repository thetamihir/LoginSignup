//
//  SignUpModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation


struct SignUpRequest : Encodable {
    let name ,  email, password , passwordConfirm : String
    let gender : String = "male"
}

