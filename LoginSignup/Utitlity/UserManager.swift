//
//  User.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation
import Moya


enum API {
    case signup(SignUpRequest)
    case login(LoginRequest)
    
}

extension API : TargetType {
    var baseURL: URL {
        switch self {
        case .login :
            return URL(string: "http://192.168.1.50:8000/api/v1/users/")!
        case .signup:
            return URL(string: "http://192.168.1.50:8000/api/v1/users/")!
        }
    }
    
    var path: String {
        switch self{
        case .login :
             return "login"
        case .signup:
            return "signup"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .login :
            return .post
        case .signup:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .login(let request) :
            return .requestJSONEncodable(request)
        case .signup (let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["contant-Typer" : "application/json"]
    }

}



// LoginRequest(email: "mihir@gmail.com", password: "mihir1234")
// SignUpRequest(name: "xyz", email: "xyz@gmail.com", password: "xyzxyz1234", passwordConfirm: "xyzxyz1234")


protocol UserMethods {
    
    func loginRequest(data  : LoginRequest ,  completion:  @escaping (Result< LoginResponse , Error>) -> ())
    func signupRequest(data  : SignUpRequest , completion:  @escaping (Result< LoginResponse , Error>) -> ())
}

struct UserManager : UserMethods {
    func signupRequest(data : SignUpRequest , completion: @escaping (Result<LoginResponse, Error>) -> ()) {
        Networkmanager.share.request(target: .signup(data), completion: completion)
    }
    
    func loginRequest(data : LoginRequest , completion: @escaping (Result<LoginResponse, Error>) -> ()) {
        Networkmanager.share.request(target: .login(data), completion: completion)
    }
    
}
