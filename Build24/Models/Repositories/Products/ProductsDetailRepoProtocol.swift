//
//  ProductsRepoProtocol.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import Foundation
import RxSwift

protocol ProductsDetailRepoProtocol {
    
    func productDetails(id: String) -> Single<ProductDetailModel>
    func reletedProduct() -> Single<[RelatedProductModel]>
    func categoryType() -> Single<[CategoryTypeModel]>
    func category() -> Single<[categoryModel]>
    func fetchCategory() -> Single<[categoryModel]>
    func fetchCategoryType() -> Single<[CategoryTypeModel]>
}



