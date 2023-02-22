//
//  NotificationModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

import Foundation

struct NotificationModel : Codable {
    
    let id: String
    let title: String
    let image : String
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case image
    }
}

