//
//  CategoryViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 19/12/22.
//

import UIKit
import Resolver
import RxSwift

class CategoryViewModel: BaseVC {
    
    @Injected var productListRepo : ProductsDetailRepoProtocol
    var categorylist = [categoryModel]()
    
    
    func categoryList() -> Observable<[categoryModel]> {
        return productListRepo.category().asObservable()
    }
    
    func fetchList() -> Observable<[categoryModel]> {
        return productListRepo.fetchCategory().asObservable()
    }
}


