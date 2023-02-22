//
//  LoginModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 2/1/23.


import Foundation

struct Login : Codable {
    let phone: String?
    let passworld: String?
    
    enum CodingKeys : String, CodingKey {
           case phone
           case passworld
       }
}
