//
//  LoginViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 2/1/23.
//

import UIKit

class LoginViewController: BaseVC {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        BackButton(var: .orange)
        keyboardView()
        setUpView()
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        submit.addTarget(self, action: #selector(didTabSubmit), for: .touchUpInside)
    }
    
    @objc func onSubmit(){
        
    }
    
    func setUpView(){
        profile.layer.cornerRadius = 60
        submit.layer.cornerRadius = 5
    }
    
    @objc func didTabSubmit(){
        phoneTextField.becomeFirstResponder()
        passwordTextField.becomeFirstResponder()
        print("login success")
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountVC")
        if phoneTextField.text == "0968707219" && passwordTextField.text == "passworld" {
            show(vc, sender: nil)
          
        } else {
            phoneTextField.layer.borderColor = .init(red: 225, green: 0, blue: 0, alpha: 1)
            phoneTextField.layer.borderWidth = 1
            passwordTextField.layer.borderColor = .init(red: 225, green: 0, blue: 0, alpha: 1)
            passwordTextField.layer.borderWidth = 1
            print("failed")
            print(passwordTextField.text)
        }
       
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneTextField  {
            passwordTextField.becomeFirstResponder()
            print(passwordTextField.text!)
        } else if textField == passwordTextField {
            didTabSubmit()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        if  textField == passwordTextField  {
            print(passwordTextField.text!)
        }
        return true
    }
    
}
