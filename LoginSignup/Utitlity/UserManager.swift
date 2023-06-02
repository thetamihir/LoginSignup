//
//  User.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation
import Moya
import RxMoya
import RxSwift

enum API {
    case signup(SignUpRequest)
    case login(LoginRequest)
    case fetchuser
    
}

extension API : TargetType {
    var baseURL: URL {
        switch self {
        case .login :
            return URL(string: "http://192.168.1.50:8000/api/v1/users/")!
        case .signup:
            return URL(string: "http://192.168.1.50:8000/api/v1/users/")!
        case .fetchuser :
            return URL(string: "http://192.168.1.50:8000/api/v1/")!
        }
    
    }
    
    var path: String {
        switch self{
        case .login :
             return "login"
        case .signup:
            return "signup"
        case .fetchuser:
            return "users"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .login :
            return .post
        case .signup:
            return .post
        case .fetchuser:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .login(let request) :
            return .requestJSONEncodable(request)
        case .signup (let request):
            return .requestJSONEncodable(request)
        case .fetchuser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["contant-Typer" : "application/json"]
    }

}



protocol UserMethods {
    func loginRequest(data : LoginRequest ,  completion:  @escaping (Result < APIResponse , NetworkError>) -> ())
    func signupRequest(data : SignUpRequest , completion:  @escaping (Result < APIResponse , NetworkError>) -> ())
}

struct UserManager : UserMethods {
    

    func loginRequest(data : LoginRequest , completion: @escaping (Result< APIResponse, NetworkError>) -> ()) {
        Networkmanager.shared.request(api: .login(data), completion: completion)
    
    }
    
    func signupRequest(data : SignUpRequest , completion: @escaping (Result< APIResponse, NetworkError>) -> ()) {
        Networkmanager.shared.request(api: .signup(data), completion: completion)
    }

}



