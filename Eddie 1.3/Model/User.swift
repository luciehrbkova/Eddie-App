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

var thisUser = User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword")

//let testUserList : [User] = [
//    User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
//    User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
//    User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
//]


