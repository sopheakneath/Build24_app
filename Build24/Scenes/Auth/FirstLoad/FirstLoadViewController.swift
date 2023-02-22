//
//  FirstLoadViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 2/1/23.
//

import UIKit

class FirstLoadViewController: BaseVC {

    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        BackButton(var: .white)
        setUpView()
        login.addTarget(self, action: #selector(gotoLogin),for: .touchUpInside)
    }
    
    func setUpView(){
        login.layer.cornerRadius = 5
        register.layer.cornerRadius = 5
        facebookView.layer.cornerRadius = 5
        googleView.layer.cornerRadius = 5
    }
    
    @objc func gotoLogin(){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.show(vc, sender: nil)
        
    }
}
