//
//  TimeooutInterrection.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 7/2/23.
//

import Foundation

struct SettingModel: Codable {
    var isBiometric: Bool = false
    var isUpdated: Bool = false
    var isUserNameEnable: Bool = true
    var autoSignOut: Int = 1
}

class TimeoutInterrection {
    
    static let shared = TimeoutInterrection()
    var idleTimer: Timer?

    lazy var timeoutInSeconds: TimeInterval = {
        var time: TimeInterval = 0
        return TimeInterval(60)
//        if let setting: SettingModel  {
//            if setting.autoSignOut != 25 {
//                time = TimeInterval(setting.autoSignOut * 60)
//            } else {
//                time = TimeInterval(setting.autoSignOut)
//            }
//            return time
//        } else {
//            return 60
//        }
    }()
 
    func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimerExceeded), userInfo: nil, repeats: false)
    }
    
    // If the timer reaches the limit as defined in timeoutInSeconds, post this notification.
    @objc func idleTimerExceeded() {
        NotificationCenter.default.post(name:Notification.Name.TimeOutUserInteraction, object: nil)
    }
}
