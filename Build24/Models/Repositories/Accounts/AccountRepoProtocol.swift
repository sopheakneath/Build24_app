//
//  AccountRepoProtocol.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 21/12/22.
//

import Foundation
import RxSwift

protocol AccountRepoProtocol {
    
    func fetchAccount() -> Single<[Result]>
}
