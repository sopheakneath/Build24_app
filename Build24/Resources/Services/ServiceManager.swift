//
//  ServiceManager.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 11/1/23.
//

import Alamofire
import UIKit
import Resolver

final class ServiceManager: SessionDelegate {
    
    static let share = ServiceManager()
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    let urlProfile = URL(string: "https://randomuser.me/api/")!
   
}

