//
//  LogOutCollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 29/12/22.
//

import UIKit

class LogOutCollectionReusableView: UICollectionReusableView {
    
    var didPress : (() -> Void)?

    @IBOutlet weak var logOutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logOutButton.layer.cornerRadius = 17.5
        logOutButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    @IBAction func btn(_ sender: Any) {
        print("HELLO BUTTON")
    }
    
    @objc func pressed(){
        didPress?()
    }
}


