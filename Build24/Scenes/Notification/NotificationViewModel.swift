//
//  NotificationViewModel.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 30/11/22.
//

import Foundation
import Resolver
import RxSwift

class NotificationViewModel {

    @Injected var notificationsRepo : NotificationsRepositoryProtocol
    
    func list() -> Observable<[NotificationModel]> {
        return notificationsRepo.list().asObservable()
    }
}
