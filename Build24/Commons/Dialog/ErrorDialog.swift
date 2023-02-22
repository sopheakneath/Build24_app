//
//  ErrorDialog.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 15/2/23.
//

import Foundation
import SwiftMessages

class ErrorDialog : UIViewController{
    
    func presentErrorDialog (title: String , _ didDismiss: (() -> Void)? = nil){
        let messageView : MessageView = MessageView.viewFromNib(layout: .messageView)
        messageView.configureContent(title: "error", body: title)
        messageView.configureTheme(.error , iconStyle: .default)
        messageView.accessibilityPrefix = "error"
        messageView.button?.isHidden = true
        messageView.configureDropShadow()
        
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = .seconds(seconds: 3)
        config.dimMode = .blur(style: .dark, alpha: 0.1, interactive: true)
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.preferredStatusBarStyle = .lightContent
       // config.eventListeners.append( _, in  didDismiss?())
        SwiftMessages.show(config: config, view: messageView)
    }
    
}
