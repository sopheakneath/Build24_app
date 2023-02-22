//
//  InterrectionUIApplication.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 7/2/23.
//


import UIKit

extension NSNotification.Name {
    public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "TimeOutUserInteraction")
}

class InterractionUIApplication: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if TimeoutInterrection.shared.idleTimer != nil {
            //TimeoutInterrection.shared.resetIdleTimer()
        }
        
        if let touches = event.allTouches {
            for touch in touches {
                if touch.phase == UITouch.Phase.began {
                   // TimeoutInterrection.shared.resetIdleTimer()
                }
            }
        }
    }
}
