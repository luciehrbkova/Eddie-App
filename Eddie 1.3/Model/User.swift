//
//  User.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 26/02/2022.
//

import Foundation

struct User {
    let email: String
    var username: String
    var password: String
    
    var userID: String {
        return email
    }
}


