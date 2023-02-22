//
//  TaskResult.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 20/12/22.
//

import Foundation


enum TaskResult<T> {
    case error(message: String?, code: Int?)
    case success(data: T)
}
