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


struct SignUpModel  {
    var name : String = String()
    var email: String = String()
    var password: String = String()
    var passwordConfirm : String = String()
    var error: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
    
    
    var buttonValidation : Bool {
        return ( name.isEmpty ||  email.isEmpty || password.isEmpty || passwordConfirm.isEmpty)
    }
    
    var buttonOpecity : Double {
        return buttonValidation ? 0.6 : 1.0
    }
   
}

