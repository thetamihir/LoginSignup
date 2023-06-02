//
//  APIResponse.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 31/05/23.
//

import Foundation


struct APIResponse: Decodable {
    let error: Bool
    let message : String
    let data: LoginResponseData?
    
    enum CodingKeys: CodingKey {
        case error
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(Bool.self, forKey: .error)
        do {
            self.message = try container.decode(String.self, forKey: .message)
        } catch {
            let array = try container.decode([String].self, forKey: .message)
            self.message = array.joined()
        }
        self.data = try container.decodeIfPresent(LoginResponseData.self, forKey: .data)
    }
}
