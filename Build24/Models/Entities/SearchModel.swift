//
//  SearchModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import Foundation

struct SearchModel : Codable {
    
    let searchTitle: String
    
    enum CodingKeys : String , CodingKey {
        case searchTitle
    }
}


