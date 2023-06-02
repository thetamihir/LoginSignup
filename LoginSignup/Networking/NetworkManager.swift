//
//  NetworkManager.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation
import Moya
import RxSwift
import RxMoya


//final class NetworkManager {
//
//    static let shared = NetworkManager()
//    private init(){}
//
//    func httpRequest<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if(error == nil && data != nil) {
//                let response = try? JSONDecoder().decode(resultType.self, from: data!)
//                print("response \(String(describing: response))")
//                _ = completionHandler(response)
//            }
//        }.resume()
//    }
//}


final class Networkmanager {

    let bag = DisposeBag()
    static let shared = Networkmanager()
    private init() {}
    var provider = MoyaProvider<API>()
    
    func request(api : API , completion: @escaping (Result<APIResponse, NetworkError>) -> ()){
        provider.rx.request(api)
            .subscribe { response in
                do {
                    let results = try JSONDecoder().decode(APIResponse.self, from: response.data)
                    switch (response.statusCode){
                    case 200 :
                        completion(.success(results))
                    case 201 :
                        completion(.success(results))
                    case 400 :
                        completion(.failure(NetworkError.response(message: results)))
                    default:
                        completion(.failure(NetworkError.invalidResult))
                    }
                } catch let error {
                    print(error)
                }
            } onFailure: { error in
                print(error)
            }.disposed(by: bag)
    }
    
    
    
    
    
    
    
    
        
//    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
//           provider.request(target) { result in
//               switch result {
//               case let .success(response):
//                   do {
//                       let results = try JSONDecoder().decode(T.self, from: response.data)
//                       completion(.success(results))
//                   } catch let error {
//                       completion(.failure(error))
//                   }
//               case let .failure(error):
//                   completion(.failure(error))
//               }
//           }
//       }
    
    
    
    

}


enum NetworkError : Error {
    case response (message : APIResponse)
    case invalidResult
    case failtodecode
}


enum MyError: Error {
    
    case dummyERROR(String)
    var message: String {
        
        switch self {
        case .dummyERROR(let message):
            return message
        }
        
    }
    
}
