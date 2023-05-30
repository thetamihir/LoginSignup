//
//  NetworkManager.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import Foundation
import Moya
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
    
    
    static var share = Networkmanager()
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    
     func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
         provider.request(target) { result in
              switch result {
              case let .success(response):
                  do {
                      let results = try JSONDecoder().decode(T.self, from: response.data)
                      print("login response :- \(results)")
                      switch response.statusCode {
                      case 200 :
                          completion(.success(results))
                      default:
                        break
                      }
                  } catch let error {
                      completion(.failure(error))
                  }
              case let .failure(error):
                  completion(.failure(error))
              }
          }
         
        
         
         
         
      }
    
}


enum NetworkError : Error {
    case response (message : Error)
    case invalidResult
    case failtodecode
}
