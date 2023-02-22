//
//  ChatRepository.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

import Foundation
import RxSwift

class ChatRepository : ChatRepositoryProtocol {
    func list() -> Single<[ChatModel]> {
        let list = [
            ChatModel(profileImage: "f2", userName: "Dara", date: "12-02-2022"),
            ChatModel(profileImage: "f4", userName: "Pisey", date: "10-02-2022")
        ]
        return Single.just(list)
    }
    
    
}

