//
//  AccountRepo.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 21/12/22.
//

import Foundation
import Resolver
import RxSwift
import Alamofire

class AccountRepo : AccountRepoProtocol {
    func fetchAccount() -> Single<[Result]> {
        return Single.create { observer in
            let dispodible = Disposables.create()
            let url = URL(string: "https://randomuser.me/api/")!
            AF.request(ServiceManager.share.urlProfile , method: .get, encoding: URLEncoding.default).responseDecodable(of:AccountModel.self ) {
                response in
                switch response.result {
                case .success(let response):
                    guard response.results != nil else {
                        return
                    }
                    observer(.success(response.results!))
                    print(response)
                case .failure(let error ):
                    observer(.failure(error))
                }
            }
            return dispodible
        }
    }
    
}
