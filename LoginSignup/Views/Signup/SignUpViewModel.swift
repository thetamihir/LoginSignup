//
//  SignUpViewModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation


class SignUpViewModel  : ObservableObject{
    
    @Published var signUpModel: SignUpModel = SignUpModel()
    private let userManager = UserManager()
    
    
    func userSignup() {
        userManager.signupRequest(data: SignUpRequest(name: signUpModel.name, email: signUpModel.email, password: signUpModel.password, passwordConfirm: signUpModel.passwordConfirm)) {
            response in
            DispatchQueue.main.async {
                switch response {
                case .success(let result) :
                    print("results is : " ,result)
                    self.signUpModel.navigate = true
                case .failure(let error) :
                    if case .response(let message) = error {
                        print("error is : ",message.message)
                        self.signUpModel.error = message.message
                        self.signUpModel.isPresentingErrorAlert = true
                    }
                   
                }
            }
        }
    }
    
}
