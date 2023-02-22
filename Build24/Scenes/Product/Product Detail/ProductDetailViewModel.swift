//
//  ProductDetailViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import UIKit
import RxSwift
import Resolver

class ProductDetailViewModel: BaseVC{

    @Injected var productDetailRepo : ProductsDetailRepoProtocol
    var productList = [RelatedProductModel]()
    
    func productDetails() -> Observable<ProductDetailModel> {
        return productDetailRepo.productDetails(id: "1").asObservable()
    }
    
    func reletedProductList() -> Observable<[RelatedProductModel]> {
        return productDetailRepo.reletedProduct().asObservable()
    }
}

