//
//  UserProfileViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 26/1/23.
//

import UIKit

class UserProfileVC
: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidLayoutSubviews() {
        let blur = UIBlurEffect(style: .regular)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.frame = view.bounds
        effectView.alpha = 0.5
        view.addSubview(effectView)
    }
}
