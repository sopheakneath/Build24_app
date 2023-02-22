//
//  ProductDetail.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 6/12/22.
//

import Foundation

// SECTION
struct ProductDetailModel : Codable {
    let productName: String
    let productLocation: String
    let productPrice: String
    let userImage: String
    let userName: String
    let userEmail: String
    // discription
    let id : Int
    let viewer: Int
    let likeCount: Int
    let category: String
    let discription: String
    enum CodingKeys : String , CodingKey {
        case productName
        case productLocation
        case productPrice
        case userImage
        case userName
        case userEmail
        case id
        case viewer
        case likeCount
        case category
        case discription
        
    }
}

// CELL

struct RelatedProductModel : Codable {
    let userImage: String
    let userName: String
    let productImage: String
    let productName: String
    let postDate: String
    let prpductPrice: String
    let isLike: Bool
    
    enum CodingKeys : String, CodingKey {
        case userImage
        case userName
        case productImage
        case productName
        case postDate
        case prpductPrice
        case isLike
    }
}

// product by category -> category type

struct CategoryTypeModel : Codable {
    let image: String
    let title: String
    
    enum CodingKeys : String, CodingKey {
        case image
        case title
    }
}

struct categoryModel: Codable {
  let userId: Int
  let id: Int
  let title: String
  let isComplete: Bool
  
  enum CodingKeys: String, CodingKey {
    case isComplete = "completed"
    case userId, id, title
  }
}
