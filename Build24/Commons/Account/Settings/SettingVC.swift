//
//  SettingVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 29/12/22.
//

import UIKit
import Resolver
import RxSwift

class SettingVC: BaseVC , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
   
    @Injected var viewModel: AccountViewModel
    var item : [Result]!
    
    var profileLists = ["Edit Profile", "Set Password", "UserName" , "Activate Phone", "Facebook", "Google", "Auto Update Profile Picture", "Provacy", "Delete Account"]
    var header = ["APP SETTING" , "SUPPORT"]
    var appSetting = ["Language", "Theme", "Notification"]
    var support = ["Posting Rule", "Privacy Polocy", "Contact Us","Rate Us" , "Safety Tips", "Feedback"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        nibRegister()
        getData()
       
    }
    
   
    
   public func getData (){
        viewModel.fetchAccountInfo()
            .observe(on: MainScheduler.instance)
            .subscribe { info in
                self.viewModel.item = info
                self.collectionView.reloadData()
                print("333",self.viewModel.item.first?.email)
            }.disposed(by: disposeBag)
    }
    
    
    func nibRegister(){
        let profileHeader = UINib(nibName: "HeaderProfileCollectionReusableView", bundle: nil)
        collectionView.register(profileHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HeaderProfileCollectionReusableView" )
        
        let Header = UINib(nibName: "HeaderSettingCollectionReusableView", bundle: nil)
        collectionView.register(Header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HeaderSettingCollectionReusableView" )
        
        let logOut = UINib(nibName: "LogOutCollectionReusableView", bundle: nil)
        collectionView.register(logOut, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"LogOutCollectionReusableView" )
        
        let settingProfile = UINib(nibName: "SettingListCollectionViewCell", bundle: nil)
        collectionView.register(settingProfile, forCellWithReuseIdentifier: "SettingListCollectionViewCell")
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
        backButton.setTitle("Setting", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.addTarget(self, action: #selector(closeTab), for: .touchUpInside)
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    @objc func closeTab(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // cell
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return profileLists.count
        } else if section == 1 {
            return appSetting.count
        } else if section == 2 {
            return support.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let profileList = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingListCollectionViewCell", for: indexPath) as! SettingListCollectionViewCell
        if indexPath.section == 0 {
            profileList.title.text = profileLists[indexPath.item]
            return profileList
        } else if indexPath.section == 1  {
            profileList.title.text = appSetting[indexPath.item]
            return profileList
        } else if indexPath.section == 2 {
            profileList.title.text = support[indexPath.item]
            return profileList
        }
        profileList.title.text = profileLists[indexPath.item]
       
        return profileList
       // return UICollectionViewCell.init()
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width , height: 40)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    // header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSettingCollectionReusableView", for: indexPath) as! HeaderSettingCollectionReusableView
        
        if indexPath.section == 0 {
            let headerProfile = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderProfileCollectionReusableView", for: indexPath) as! HeaderProfileCollectionReusableView
           
            print("1212", viewModel.item.first?.name?.last)
            let title = viewModel.item.first?.name?.title
            let fisrt = viewModel.item.first?.name?.first
            let last = viewModel.item.first?.name?.last

           // headerProfile.name.text = "\(title), \(fisrt),\(last)"
            headerProfile.email.text = viewModel.item.first?.email
            headerProfile.name.text = viewModel.item.first?.name?.last
            headerProfile.didPress = { [weak  self] in
                let storyboad = UIStoryboard(name: "UserProfile", bundle: nil)
                let vc = storyboad.instantiateViewController(withIdentifier: "UserProfileVC")
                vc.hidesBottomBarWhenPushed = true
                self?.show(vc, sender:nil)
            }
            
            return headerProfile
            
        }else if indexPath.section == 1 {
            header.title.text = "APP SETTING"
            return header
        } else if  indexPath.section == 2 {
            header.title.text = "SUPPORT"
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LogOutCollectionReusableView", for: indexPath) as! LogOutCollectionReusableView
            footer.didPress = { [ weak self] in
              
//                let storyboardContact = UIStoryboard(name: "Contact", bundle: nil)
//                let contactVC = storyboardContact.instantiateViewController(withIdentifier: "ContactVC")
//                self?.navigationController?.pushViewController(contactVC, animated: true)
                self?.showAlert()
            }
            
            return footer
        }
        return UICollectionReusableView.init()
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 120)
        } else if section == 3 {
            return CGSize(width: view.frame.width, height: 150)
        }
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Logout?", message: "Are you sure you want to logout? You can login back to access your content.", preferredStyle: .alert)
          
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Logout",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            print("Logout success")
            
            let storyboard = UIStoryboard(name: "FirstLoad", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FirstLoadViewController")
            vc.hidesBottomBarWhenPushed = true
            self.show(vc, sender: nil)
            
            //                let storyboardContact = UIStoryboard(name: "Contact", bundle: nil)
            //                let contactVC = storyboardContact.instantiateViewController(withIdentifier: "ContactVC")
            //                self?.navigationController?.pushViewController(contactVC, animated: true)
          //  show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
        }))
         
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    
}
