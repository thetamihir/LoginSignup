//
//  HomeviewModel.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 02/06/23.
//

import Foundation


class HomeViewModel  : ObservableObject{
    
    private let userManager = UserManager()
    
    func fetchUser() {
        print("user")
    }
    
}
