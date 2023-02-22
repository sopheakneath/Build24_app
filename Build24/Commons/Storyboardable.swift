//
//  Storyboardable.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import UIKit

protocol Storyboardable  {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    
    static func instantiate() -> Self
}

extension Storyboardable where Self: BaseVC {
    
    static var storyboardName: String {
        return String(String(describing: self).dropLast(2))
    }
    
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        if String(String(describing: self).suffix(2)) != "VC" {
            fatalError("\(String(describing: self)) doesn't follow project's naming convention!")
        }
        
        guard let vc = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
            .instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to instantiate view controller with identifier: \(storyboardIdentifier)")
        }
        return vc
    }
}


