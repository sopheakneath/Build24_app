//
//  SearchRepositoryProtocol.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import Foundation
import RxSwift

protocol SearchRepositoryProtocol {
    func list()-> Single<[SearchModel]>
}
