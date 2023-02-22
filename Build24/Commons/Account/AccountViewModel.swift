//
//  AccountViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 28/11/22.
//

import UIKit
import RxSwift
import Resolver

class AccountViewModel: BaseViewModel  {
 
    @Injected var accountRepo : AccountRepoProtocol
    var item = [Result]()
   
    func fetchAccountInfo() -> Observable<[Result]> {
        return accountRepo.fetchAccount().asObservable()
    }
}
