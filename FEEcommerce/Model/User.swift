//
//  User.swift
//  FEEcommerce
//
//  Created by baohoang on 11/02/2022.
//

import Foundation

struct UserGET:Codable{
    let id:String
    let email: String
    let username: String
    let phone: String
    let DOB: String
}

struct UserPOST:Codable{
    let email: String
    let password: String
    let username: String
    let phone: String
    let DOB: String
}
