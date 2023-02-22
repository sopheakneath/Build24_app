//
//  QRScanViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 12/12/22.
//

import UIKit



class QRScanVC: BaseVC {
   
    @IBOutlet weak var uiView: UIView!
    let scaner = Scaner()
    let qrView = MyQR()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addBackButton()
        uiView.addSubview(scaner)
        scaner.frame = uiView.bounds
 
    }

    @IBOutlet weak var ViewScreen: UIView!
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            ViewScreen.backgroundColor = UIColor.black
            uiView.addSubview(scaner)
            scaner.frame = uiView.bounds
            
            MyQR().removeFromSuperview()
        } else {
            ViewScreen.backgroundColor = UIColor.white
            navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
            Scaner().removeFromSuperview()
            uiView.addSubview(qrView)
            qrView.frame = uiView.bounds

        }
    }
   
    func addBackButton() {
        
        let backButton = UIButton(type: .custom)
        
        if #available(iOS 13.0, *) {
            backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        }
        else {
            backButton.setImage(UIImage(named: "chevron.backward"), for: .normal)
        }
        backButton.imageView?.contentMode = .scaleAspectFit
     //   backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(closeTab), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.hidesBottomBarWhenPushed = false
    }

    @objc func closeTab(){
        self.navigationController?.popViewController(animated: true)
    }

}
