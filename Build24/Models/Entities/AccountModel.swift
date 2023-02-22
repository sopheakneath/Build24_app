
import Foundation

struct AccountModel : Codable  {
    let results: [Result]?
    enum CodingKeys : String, CodingKey {
        case results
    }
}

struct Result : Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let picture: Picture?
    
    enum CodingKeys : String, CodingKey {
           case gender
           case name
           case location
           case email
           case picture
       }
}

struct Location : Codable {
    let street: Street?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    
    enum CodingKeys : String, CodingKey {
        case street
        case city
        case state
        case country
        case postcode
    }
}

struct Street : Codable{
    let number: Int?
    let name: String?
    
    enum CodingKeys : String, CodingKey {
        case number
        case name
    }
}

struct Name : Codable {
    let title: String?
    let first: String?
    let last: String?
    
    enum CodingKeys : String, CodingKey {
        case title
        case first
        case last
    }
}

struct Picture : Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
    
    enum CodingKeys : String, CodingKey {
        case large
        case medium
        case thumbnail
    }
}
