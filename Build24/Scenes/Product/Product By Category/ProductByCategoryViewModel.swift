//
//  ProductByCategoryViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 9/12/22.
//

import UIKit
import RxSwift
import Resolver

class ProductByCategoryViewModel: BaseVC {
    
    @Injected var ProductCategory : ProductsDetailRepoProtocol
    var categoryType = [CategoryTypeModel]()
    func categoryTypeList() -> Observable<[CategoryTypeModel]> {
        return ProductCategory.categoryType().asObservable()
    }
}


