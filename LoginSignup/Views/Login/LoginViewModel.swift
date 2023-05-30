//
//  LoginViewModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation

//class LoginViewModel : ObservableObject
//{
//    @Published var loginDataModel: LoginDataModel = LoginDataModel()
//    private let loginValidation = LoginValidation()
//    private let loginResource: LoginResource = LoginResource()
//
//    // validate the user inputs
//    func validateUserInputs() -> Bool {
//
//        let result = loginValidation.validateUserInputs(userEmail: loginDataModel.email, userPassword: loginDataModel.password)
//        if(result.success == false){
//            loginDataModel.error = result.errorMessage ?? "error occured"
//            loginDataModel.isPresentingErrorAlert = true
//
//            return false
//        }
//
//        return true
//    }
//
//    //call the api
//    func authenticateUser() {
//
//        let request = LoginRequest(email: loginDataModel.email, password: loginDataModel.password)
//        loginResource.authenticate(loginRequest: request) { response in
//            DispatchQueue.main.async {
//                if(response?.error == nil){
//                    self.loginDataModel.navigate = true
//                }else{
//                    self.loginDataModel.error = response?.error ?? "error occured"
//                    self.loginDataModel.isPresentingErrorAlert = true
//                }
//            }
//        }
//    }
//}
//
//
//
//struct LoginResource {
//
//    func authenticate(loginRequest: LoginRequest, completionHandler:@escaping(_ result: LoginResponse?)->Void) {
//
//        var urlRequest = URLRequest(url: URL(string: "http://192.168.1.25:8000/api/v1/users/login")!)
//        urlRequest.httpMethod = "post"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
//        urlRequest.httpBody = try? JSONEncoder().encode(loginRequest)
//
//        NetworkManager.shared.httpRequest(request: urlRequest, resultType: LoginResponse.self) { response in
//            _ = completionHandler(response)
//        }
//    }
//}



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
       
    
    func authenticateUser() {
        userManager.loginRequest(data: LoginRequest(email: loginDataModel.email, password: loginDataModel.password)) {
            response in
            DispatchQueue.main.async {
                switch response {
                case .success(let result) :
                    print(result)
                    self.loginDataModel.navigate = true
                case .failure(let error) :
                    self.loginDataModel.error = error.localizedDescription
                    self.loginDataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
    
}
