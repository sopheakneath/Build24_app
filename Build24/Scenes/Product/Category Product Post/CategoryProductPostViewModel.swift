//
//  CategoryProductPostViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 20/12/22.
//

import UIKit
import Resolver
import RxSwift

class CategoryProductPostViewModel: BaseVC {

    @Injected var subCategoryListRepo : ProductsDetailRepoProtocol
    var subcategorylist = [CategoryTypeModel] ()
    
    func fetchList() -> Observable<[CategoryTypeModel]> {
        return subCategoryListRepo.fetchCategoryType().asObservable()
    }

}
