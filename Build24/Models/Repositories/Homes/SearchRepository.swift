//
//  SearchRepository.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import Foundation
import RxSwift

class SearchRepository : SearchRepositoryProtocol {
    func list() -> Single<[SearchModel]> {
        let list = [
            SearchModel(searchTitle: "ipone12"),
            SearchModel(searchTitle: "ipone13"),
            SearchModel(searchTitle: "food"),
            SearchModel(searchTitle: "beauti")
        ]
        return Single.just(list)
    }
    
    
}
