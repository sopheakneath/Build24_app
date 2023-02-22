//
//  ChatModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

//import Foundation
//
//struct ChatModel : Codable {
//    let profileImage: String
//    let userName: String
//    let date: String
//
//    enum CodingKeys : String , CodingKey {
//        case profileImage
//        case userName
//        case data
//    }
//}


import Foundation

struct ChatModel : Codable {

    let profileImage: String
    let userName: String
    let date : String

    enum CodingKeys : String, CodingKey {
        case profileImage
        case userName
        case date
    }
}
