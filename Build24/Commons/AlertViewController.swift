//
//  ViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 31/12/22.
//

import UIKit

class AlertViewController: UIViewController {

    func showAlert() {
        let alert = UIAlertController(title: "Logout?", message: "Are you sure you want to logout? You can login back to access your content.", preferredStyle: .alert)
          
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Logout",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
        }))
         
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }

}
