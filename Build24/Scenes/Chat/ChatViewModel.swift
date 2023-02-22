//
//  ChatViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 30/11/22.
//

import UIKit
import RxSwift
import Resolver

class ChatViewModel {

    @Injected var chatRepo : ChatRepositoryProtocol
    
    func list() -> Observable<[ChatModel]> {
        return chatRepo.list().asObservable()
    }
    

}
