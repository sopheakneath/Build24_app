//
//  ProductsRepo.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import Foundation
import RxSwift
import Alamofire
import Resolver

class ProductsDetailRepo : ProductsDetailRepoProtocol {
    
    func categoryType() -> Single<[CategoryTypeModel]> {
        let list = [
           CategoryTypeModel(image: "phone-cg", title: "Phone"),
           CategoryTypeModel(image: "tablet-cg", title: "Tablet"),
           CategoryTypeModel(image: "food", title: "food")
        ]
        return Single.just(list)
    }
    
   
    
    func category()-> Single<[CategoryTypeModel]> {
        let list = [
            CategoryTypeModel(image: "food", title: "food"),
            CategoryTypeModel(image: "food", title: "food"),
            CategoryTypeModel(image: "food", title: "food"),
            CategoryTypeModel(image: "food", title: "food"),
            CategoryTypeModel(image: "food", title: "food"),
        ]
        return Single.just(list)
    }
    
    func reletedProduct() -> Single<[RelatedProductModel]> {
        let list = [
            RelatedProductModel(userImage: "profile1", userName: "sopheakneath", productImage: "phone1", productName: "iphone 1", postDate: "12-Nov-2022", prpductPrice: "$330", isLike: true),
            RelatedProductModel(userImage: "profile2", userName: "Lyncy", productImage: "phone2", productName: "iphone 2", postDate: "10-Dec-2022", prpductPrice: "$540", isLike: false),
            RelatedProductModel(userImage: "profile3", userName: "Heng Heng", productImage: "phone3", productName: "iphone 3", postDate: "02-Nov-2022", prpductPrice: "$910", isLike: true),
            RelatedProductModel(userImage: "profile4", userName: "sopheakneath", productImage: "phone4", productName: "iphone 12", postDate: "12-Nov-2022", prpductPrice: "$399", isLike: false),
            RelatedProductModel(userImage: "f2", userName: "Piset", productImage: "f3", productName: "iphone 12", postDate: "12-Nov-2022", prpductPrice: "$400", isLike: false)
        ]
        return Single.just(list)
        
    }
    
    func productDetails(id: String) -> Single<ProductDetailModel> {
        return Single.just(
            ProductDetailModel(productName: "Iphone 12",
                               productLocation: " Phnom penh ",
                               productPrice: "$1323",
                               userImage: "ownUser",
                               userName: "sopheakneath",
                               userEmail: "neath@GMAIL.COM",
                               id: 1,
                               viewer: 23,
                               likeCount: 20,
                               category: "Phone",
                               discription: " The following purchases with Apple Card are ineligible to earn 5% back: monthly financing through Apple Card Monthly Installments, Apple iPhone Payments, the iPhone Upgrade Program, and wireless carrier financing plans; Apple Media Services; AppleCare+ monthly payments"
                              )
        )
    }
    
    
    func category() -> Single<[categoryModel]> {
        let list = [
        categoryModel(userId: 1, id: 1, title: "milk tea", isComplete: true),
        categoryModel(userId: 2, id: 2, title: "coffee", isComplete: false),
        categoryModel(userId: 3, id: 3, title: "food", isComplete: true)
        ]
        return Single.just(list)
    }
    
    func fetchCategory() -> Single<[categoryModel]> {
        return Single.create { observer in
            let dispodible = Disposables.create()
           // let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
            AF.request(ServiceManager.share.url,method: .get,encoding: URLEncoding.default).responseDecodable(of: [categoryModel].self) { response in
                switch response.result {
                case .success(let response):
                    observer(.success(response))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return dispodible
        }
    }
    
    func fetchCategoryType() -> Single<[CategoryTypeModel]> {
        return Single.create { observer in
            let dispodible = Disposables.create()
           // let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
            AF.request(ServiceManager.share.url , method: .get, encoding: URLEncoding.default).responseDecodable(of: [CategoryTypeModel].self) { response in
                switch response.result {
                case .success(let response):
                    observer(.success(response))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return dispodible
        }
      
        }
    
    func fetchAccount() {
        
    }
   
    
}


