//
//  CustomBackNavigationViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 2/1/23.
//

import UIKit

class CustomBackNavigationViewController: UIViewController {

    func BackButton() {
        let backButton = UIButton(type: .custom)
        if #available(iOS 13.0, *) {
            backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        }
        else {
            backButton.setImage(UIImage(named: "chevron.backward"), for: .normal)
        }
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(closeTab), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
    }
    
    @objc func closeTab(){
        self.navigationController?.popViewController(animated: true)
    }

}

extension UIButton {
   
}
