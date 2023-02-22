//
//  ContactVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 14/12/22.
//

import UIKit

class ContactVC: BaseVC , UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
     var isPressed : Bool = false
    private var isShowSheet = false
    
   
    // let buttomsheet = sheet
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var uiView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = nil
      //  tabBarController?.tabBar.isHidden = true
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.showsVerticalScrollIndicator = false
        nibRegister()
        uiView.layer.cornerRadius = 20
        uiView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    @IBAction func PhoneCall(_ sender: Any) {
        if let url = NSURL(string: "tel://\("0123333")"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
            
        }
        
       
//        guard let number = URL(string: "tel://" + "01222222") else { return }
//        UIApplication.shared.open(number)
    }
    
    @IBOutlet weak var heightContraint: NSLayoutConstraint!
    
    @IBAction func Email(_ sender: Any) {
        isPressed = true
    }
    
    @IBAction func callButton(_ sender: Any) {
      //  showMyViewControllerInACustomizedSheet()
        isShowSheet = true
        showSheet()
    }

    @IBAction func closeSheet(_ sender: Any) {
        isShowSheet = false
        showSheet()
    }
    
    func showSheet(){
        if (isShowSheet) {
            UIView.animate(withDuration: 0.3, animations: {
              //  self.heightContraint.constant = self.view.frame.height
                self.heightContraint.constant = 500
                self.view.layoutIfNeeded()
            } ) { (status ) in
                // completetion code
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.heightContraint.constant = 0
                self.view.layoutIfNeeded()
            } ) { (status ) in
                // completetion code
            }
        }
    }
    
    func showMyViewControllerInACustomizedSheet() {
//        let storyboard = UIStoryboard(name: "ButtomSheet", bundle: nil)
//        let sheetVc = storyboard.instantiateViewController(identifier: "ButtomSheet") as! ButtomSheet
//        if let sheet = sheetVc.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersEdgeAttachedInCompactHeight = true
//            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//        }
//        present(sheetVc, animated: true, completion: nil)
    }
    
    func nibRegister(){
        let phoneNib = UINib(nibName: "PhoneCollectionReusableView", bundle: nil)
        collectioView.register(phoneNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PhoneCollectionReusableView")
        let EmailNib = UINib(nibName: "EmailCollectionReusableView", bundle: nil)
        collectioView.register(EmailNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "EmailCollectionReusableView")
        let TimeNib = UINib(nibName: "TimeCollectionReusableView", bundle: nil)
        collectioView.register(TimeNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TimeCollectionReusableView")
        let nibCell = UINib(nibName: "ContactCollectionViewCell", bundle: nil)
        collectioView.register(nibCell, forCellWithReuseIdentifier: "ContactCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 0
        }else {
            return 7
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let phone = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PhoneCollectionReusableView", for: indexPath) as! PhoneCollectionReusableView
            return phone
        } else if indexPath.section == 1 {
            let email = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EmailCollectionReusableView", for: indexPath) as! EmailCollectionReusableView
            return email
        } else {
            let time = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TimeCollectionReusableView", for: indexPath) as! TimeCollectionReusableView
            time.didPressed = {[weak self] in
              
                self?.isPressed = true
            }
            return time
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath) as! ContactCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

