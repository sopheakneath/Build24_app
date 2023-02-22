//
//  NotificationsRepositoryProtocol.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 1/12/22.
//

import Foundation
import RxSwift

protocol NotificationsRepositoryProtocol {
    
    func list() ->Single<[NotificationModel]>
    
}

