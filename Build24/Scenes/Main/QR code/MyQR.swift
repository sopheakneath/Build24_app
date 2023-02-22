//  
//  MyQR.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 13/12/22.
//

import UIKit

final class MyQR: NibView {
    
    @IBOutlet weak var profile: UIImageView!
    override func commitUI() {
        profile.layer.cornerRadius = frame.height / 2
    }
}


