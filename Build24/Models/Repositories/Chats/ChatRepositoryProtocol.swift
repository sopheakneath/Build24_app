//
//  ChatRepositoryProtocol.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

import Foundation
import RxSwift

protocol ChatRepositoryProtocol {
    func list() -> Single<[ChatModel]>
}


