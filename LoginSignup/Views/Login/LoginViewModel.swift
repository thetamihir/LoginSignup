//
//  LoginViewModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation
import RxSwift
import Moya



class LoginViewModel : ObservableObject {
    
        @Published var loginDataModel: LoginDataModel = LoginDataModel()
        private let loginValidation = LoginValidation()
        private let userManager = UserManager()
    
    
        func validateUserInputs() -> Bool {
            let result = loginValidation.validateUserInputs(userEmail: loginDataModel.email, userPassword: loginDataModel.password)
            if(result.success == false){
                loginDataModel.error = result.errorMessage ?? "error occured"
                loginDataModel.isPresentingErrorAlert = true
                return false
            }
            return true
        }
       
    
    func userLogin() {
        userManager.loginRequest(data: LoginRequest(email: loginDataModel.email, password: loginDataModel.password)) {
            response in
            DispatchQueue.main.async {
                switch response {
                case .success(let result) :
                    print(result)
                    self.loginDataModel.navigate = true
                case .failure(let error) :
                    if case .response(let message) = error {
                        self.loginDataModel.error = message.message
                    }
                    self.loginDataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
}
