//
//  FormPostvc.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/12/22.
//

import UIKit
import ButtonOnKeyboard

class FormPostVC: BaseVC , UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardView()
        country.delegate = self
    }
    
    func setUpButton(){
        submitButton.addTarget(self, action: #selector(didTabSubmit), for: .touchUpInside)
    }
    
    
    /// 
    
    @objc func didTabSubmit(){
        country.becomeFirstResponder()
        print("login success")
        let storyboard = UIStoryboard(name: "Account", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountVC")
        if country.text != ""{
           print("success")
        
        } else {
            print("failed")
        }
       
    }
}

extension FormPostVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == country  {
            country.becomeFirstResponder()
            print(country.text!)
        } else if textField == country {
            didTabSubmit()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
        if  textField == country  {
            print(country.text!)
        }
        return true
    }
    
}
