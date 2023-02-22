//
//  AccountVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import UIKit
import Resolver
import RxSwift

class AccountVC: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @Injected var viewModel: AccountViewModel
    var item : [Result]!
    var data : Result!
    var labels = ["Like", "Saved","Applied jobs","Job Applicants"]
    var icon = ["heart.fill", "bookmark.fill","bag.fill","doc.richtext.fill"]
   
    @IBOutlet weak var setting: UIButton!
    @IBAction func setting(_ sender: Any) {
    }
    @IBOutlet weak var navigationView: UINavigationItem!
    @IBOutlet weak var rightBarNavigationView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var share: UIButton!
    
    public var statusBarStyle: UIStatusBarStyle  = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return statusBarStyle
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBarNavigationView.backgroundColor = .black
        collectionview.dataSource = self
        collectionview.delegate = self
        getData()
        registerNib()
        collectionview.contentInsetAdjustmentBehavior = .never
        statusBarStyle = .darkContent
        profileImage.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        headerName.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        share.addTarget(self, action: #selector(shareAccount), for: .touchUpInside)
        
        let navBarAppearance = UINavigationBarAppearance()
           navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.green
        setting.addTarget(self, action: #selector(gotoSetting), for: .touchUpInside)
    }
    
    @objc func shareAccount(){
        let items = ["This app is my favorite"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @objc private func gotoSetting(){
        let storyboard = UIStoryboard(name: "Setting", bundle: nil)
        let vcSetting = storyboard.instantiateViewController(identifier: "SettingVC") as! SettingVC
        // testing screen
        show(vcSetting, sender: nil)
    }
    
    func getData (){
        viewModel.fetchAccountInfo()
            .observe(on: MainScheduler.instance)
            .subscribe { info in
                self.viewModel.item = info
                self.collectionview.reloadData()
                self.setUpHeader()
            }.disposed(by: disposeBag)
    }
   
    func setUpHeader(){
        headerName.text = viewModel.item.first?.name?.last
    }
    
    func registerNib() {

        let nipProfileitem = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        collectionview.register(nipProfileitem, forCellWithReuseIdentifier: "itemprofileid")
        let nipProfileInfo = UINib(nibName:"ProfileInfoCollectionReusableView" , bundle: nil)
        collectionview.register(nipProfileInfo, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "profileinfoid")
        let bannerProfile = UINib(nibName: "CollectionReusableView", bundle: nil)
        collectionview.register(bannerProfile, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "bannerid")
        let itemSell = UINib(nibName: "SellItemCollectionViewCell", bundle: nil)
        collectionview.register(itemSell, forCellWithReuseIdentifier: "sellitemid")
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return 3
        }
        return Int()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let profileInfo = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "profileinfoid", for: indexPath) as! ProfileInfoCollectionReusableView
            //profileInfo.setUpdata(with: viewModel.item[indexPath.section])
            

            viewModel.fetchAccountInfo()
                .observe(on: MainScheduler.instance)
                .subscribe { info in
                    profileInfo.setUpdata(with: info[indexPath.row])
                }.disposed(by: disposeBag)
            
            print("ITEM: \(self.viewModel.item.first?.gender)")
            profileInfo.numFollower.text = "23"
           // profileInfo.setUpdata(with: viewModel.item[indexPath.row] )
           
            profileInfo.didPress = {[weak self] in
               let storyboard = UIStoryboard(name: "QRScan", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "QRScanVC")
                self?.show(vc, sender: nil)
                
            }
            return profileInfo
            
        } else {
            let banner = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "bannerid", for: indexPath) as!CollectionReusableView
            return banner
        }
        return UICollectionReusableView.init()
    }
    
    // section cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let labelItem = collectionView.dequeueReusableCell(withReuseIdentifier: "itemprofileid", for: indexPath) as! ProfileCollectionViewCell
            labelItem.icon.image = UIImage(systemName: icon[indexPath.item])
            labelItem.title.text = labels[indexPath.item]
           
            return labelItem
        } else {
            let itemsell = collectionView.dequeueReusableCell(withReuseIdentifier: "sellitemid", for: indexPath) as! SellItemCollectionViewCell
           return itemsell
        }
        return UICollectionViewCell.init()
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2.2)
        if indexPath.section == 0  {
            return CGSize(width: width, height: 50 )
        } else {
            return CGSize(width: width, height: 50)
        }
        return CGSize.init()
    }
    
    // magin view of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        } else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        
        return UIEdgeInsets.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 10
        }
        return CGFloat.init()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 10
        }
        return CGFloat.init()
    }
    
    // size of header section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      
        if section == 0 {
            return CGSize(width: view.frame.width, height:287)
        } else if section == 1 {
            return CGSize(width: view.frame.width, height:400)
        }
        else {
            return CGSize(width: 30, height: 30)
        }
     
        return CGSize.init()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = collectionview.contentOffset.y / 150
        if offset > 0 {
            navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green:0, blue: 225, alpha: offset)
            profileImage.tintColor = UIColor(red: 0, green:225, blue: 0, alpha: offset)
            headerName.tintColor = UIColor(red: 0, green:0, blue: 0, alpha: offset)
            statusBarStyle = .lightContent
        } else if offset <= 0 {
            navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green:0 , blue: 0, alpha: 0)
            profileImage.tintColor = UIColor(red: 0, green:0, blue: 0, alpha: 0)
            headerName.tintColor = UIColor(red: 225, green:0, blue: 0, alpha: 0)
            statusBarStyle = .darkContent
        }
        
    }
    
}


