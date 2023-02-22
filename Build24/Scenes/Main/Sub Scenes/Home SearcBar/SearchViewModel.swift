//
//  SearchViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import UIKit
import Resolver
import RxSwift


class SearchViewModel: UIView {

    @Injected var searchRepo : SearchRepositoryProtocol
    
    func list() -> Observable<[SearchModel]> {
        
        return searchRepo.list().asObservable()
    }
    
}


