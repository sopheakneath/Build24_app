//
//  BaseVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import Foundation
import UIKit
import RxSwift
import SwiftMessages

class BaseVC : UIViewController, Storyboardable {

    let disposeBag = DisposeBag()
    
    // Back Navigation Button
    func BackButton( var color: UIColor   ) {
        
        let backButton = UIButton(type: .custom)
        if #available(iOS 13.0, *) {
            backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        }
        
        else {
            backButton.setImage(UIImage(named: "chevron.backward"), for: .normal)
        }
        backButton.tintColor = color
        backButton.imageView?.contentMode = .scaleAspectFit
        //backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(backWard), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func backWard(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // keyboard View
    func keyboardView(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hidKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc private func hidKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification : NSNotification ){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
            NSValue {
           
            let keyboardHeight = keyboardFrame.cgRectValue.height - 300
           // let buttomSpace = self.view.frame.height - nextButton
            self.view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(){
        self.view.frame.origin.y = 0
    }
   
    
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
