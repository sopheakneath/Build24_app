//
//  NotificationsRepository.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

import Foundation
import RxSwift

class NotificationsRepository : NotificationsRepositoryProtocol {
    
    func list() -> Single<[NotificationModel]> {
        let list = [
                NotificationModel(id: "Approve", title: "hi , congratulation your order was approved" , image: "approved"),
                NotificationModel(id: "Approved", title: "hi , congratulation your order was approved", image: "approved"),
                NotificationModel(id: "Success!", title: "congratulation your order has been successfully", image: "success"),
            ]
        return Single.just(list)
    }
    
}



