//
//  MainVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 22/11/22.
//

import UIKit
import Resolver
import RxSwift

class MainVC: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var photo = ["i1", "i2", "i3", "i4", "i5", "i6","i7", "i8", "i9","i10","i11","i12"]
    var labe1 = ["Phone", "Car and Vechicles", "computer & Accessories", "Electronics", "House & Lands", "Jobs","Services", "Fashion & Beauty", "Furniture & Decor","Book, Sport & Hobbies","Pets","Foods", ]
    var testPhoto = ["i1", "i2", "i3", "i4", "i5", "i6","i7", "i8", "i9","i10","i11","i12"]
    var listProduct = ["phone1","bag-girl", "beef","phone4", "product3","product2", "fashion","food", "product3","product2", "product3", "f1"]
    var productName = ["iphone12", "labtop","iphone12", "labtop","iphone12", "labtop","iphone12", "labtop","iphone12", "labtop","iphone12", "iphone12"]
    var margin : CGFloat = 10
    var numberOfItem: CGFloat = 3.1
   
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var languageBtn: UIButton!
    
   // @Injected private var viewModel: MainViewModel
//    @IBOutlet weak var lblName: UILabel!
//    @IBOutlet weak var lblExchangeRate: UILabel!
    private let button : UIButton = {
        let button = UIButton()
        return button
    }()
  
    // to hid navigation bar
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
   // to hid navidation bar when scroll
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
      }
  
    public var statusBarStyle: UIStatusBarStyle  = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle  {

        return statusBarStyle
    }
    
    @objc func onClickMessageButton() {
        let vc = AccountVC()
        vc.title = "hello"
        present(vc, animated: true)
            print("Message")
        }
    
    var messageImage = UIImage(systemName: "bell")
//    override func willMove(toParent parent: UIViewController?) {
//        self.tabBarController?.tabBar.isHidden = true
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = true
      }

    override func viewDidLoad() {
        
        setupTabBar()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.systemBackground
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        let nip = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        collectionView.register(nip, forCellWithReuseIdentifier: "photocellid")
        let nipPic = UINib(nibName: "ProductPictureCollectionViewCell", bundle: nil)
        collectionView.register(nipPic, forCellWithReuseIdentifier: "pictureid")
        let nipheader = UINib(nibName: "HeaderCollectionReusableView", bundle: nil)
        collectionView.register(nipheader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerviewid")
        let nipHeaderProductList = UINib(nibName:"HeaderListProductCollectionReusableView" , bundle: nil)
        collectionView.register(nipHeaderProductList, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerlistproductid")
      
//        viewModel.name
//            .observe(on: MainScheduler.instance)
//            .subscribe { text in
//                self.lblName.text = text
//            }.disposed(by: self.disposeBag)
//
//        viewModel.exchangeRate()
//            .observe(on: MainScheduler.instance)
//            .subscribe { rate in
//                self.lblExchangeRate.text = rate
//            }.disposed(by: self.disposeBag)
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Search", bundle: nil)
//        let vcSearch = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
//        vcSearch.hidesBottomBarWhenPushed = true
//        show(vcSearch, sender: nil)
       // self.ErrorDialog.err
        self.presentErrorDialog(title: "this is error message")
        
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let vcSearch = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        vcSearch.hidesBottomBarWhenPushed = true
        show(vcSearch, sender: nil)
    }
    
    @objc func gotoDetail(){
        let vc = ProductDetailVC()
        present(vc, animated: true)
    }
    
    @IBAction func QR(_ sender: Any) {
        let storyboard = UIStoryboard(name: "QRScan", bundle: nil)
        let qrVc = storyboard.instantiateViewController(identifier: "QRScanVC") as! QRScanVC
        qrVc.hidesBottomBarWhenPushed = true
        // Testing screen
        show(qrVc, sender: nil)
        print("hello QR")
       
    }
    
    private func setUpMiddleButton() {
        let sell = UIButton(frame: CGRect(x: self.view.bounds.width / 2, y:  -20, width: 60, height: 60))
        sell.backgroundColor = UIColor.orange
        sell.setBackgroundImage(UIImage(systemName: "home"), for: .normal)
    }
   
    
    private func setupTabBar() {
        
        guard var subVCs = self.tabBarController?.viewControllers else {
            return
        }
        
        let notificationVC = NotificationVC.instantiate()
        let notificationNav = UINavigationController(rootViewController: notificationVC)
        notificationVC.tabBarItem.badgeValue = "NEW"
       
       // notificationLabel.addBadge(text: "4")
      //  tabBarItem.badgeValue = "NEW"
        notificationVC.tabBarItem.badgeColor = .red
        notificationNav.tabBarItem.image = UIImage(systemName: "bell.fill")
        
        let chatVC = ChatVC.instantiate()
        let chatNav = UINavigationController(rootViewController: chatVC)
        chatNav.tabBarItem.image = UIImage(systemName: "message.fill")
        
        let accountVC = AccountVC.instantiate()
        let acountNav = UINavigationController(rootViewController: accountVC)
        accountVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        
        subVCs.append(notificationNav)
        subVCs.append(chatNav)
        subVCs.append(acountNav)
      
        
        self.tabBarController?.viewControllers = subVCs
        self.tabBarController?.tabBar.backgroundColor = .systemBackground 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return photo.count
        } else if section == 1 {
            return listProduct.count
        }
        return Int()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: "photocellid", for: indexPath) as! PhotoCollectionViewCell
        cellCategory.uiImage.image = UIImage(named: photo[indexPath.item])
        let arrlabel = labe1[indexPath.item]
        cellCategory.labelImage.text = arrlabel
        cellCategory.PressButton = {[weak self] in
            let storyboard = UIStoryboard(name: "ProductByCategory", bundle: nil)
            let vcProductDetail = storyboard.instantiateViewController(identifier: "ProductByCategoryViewController") as! ProductByCategoryViewController
            self?.show(vcProductDetail, sender: nil)
        }

        let cellPicture = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureid", for: indexPath) as! ProductPictureCollectionViewCell
        cellPicture.labelPrice.text = productName[indexPath.item]
        cellPicture.productImage.image = UIImage(named: listProduct[indexPath.item])
        cellPicture.ButtonDidPress = {[ weak self] in

            let storyboard = UIStoryboard(name: "ProductDetail", bundle: nil)
            let vcProductDetail = storyboard.instantiateViewController(identifier: "ProductDetailVC") as! ProductDetailVC
            self?.show(vcProductDetail, sender: nil)
          
        }

        if indexPath.section == 0 {
            return cellCategory
        } else {
            return cellPicture
        }
        return UICollectionViewCell.init()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / numberOfItem) - margin
        
        if indexPath.section == 0 {
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: (view.frame.width) - margin, height: (view.frame.width) - margin)
        }
        return CGSize.init()
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        } else {
            return UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 30)
        }
        
        return UIEdgeInsets.init()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return margin
        } else {
            return margin
        }
        return CGFloat.init()
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return margin
        } else {
            return margin
        }
        return CGFloat.init()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
      
        if section == 0 {
            return CGSize(width: view.frame.width, height: 230)
        } else if section == 1 {
            return CGSize(width: view.frame.width, height: 400)
        }
        else {
            return CGSize(width: 30, height: 30)
        }
     
        return CGSize.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerviewid", for: indexPath) as! HeaderCollectionReusableView
        reusableHeaderView.bannerImageview.image = UIImage(named: "ipad-featured-promotion")
        
        if indexPath.section == 0 {
            return reusableHeaderView
            
        } else if indexPath.section == 1 {

            let productListHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerlistproductid", for: indexPath) as! HeaderListProductCollectionReusableView
            let storyboard = UIStoryboard(name: "Category", bundle: nil)
            let cotegoryVC = storyboard.instantiateViewController(withIdentifier: "CategoryVC") as! CategoryVC
            let storyboardContact = UIStoryboard(name: "Contact", bundle: nil)
           
            let contactVC = storyboardContact.instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
            contactVC.hidesBottomBarWhenPushed = true
            
            productListHeader.didPressSelling = {[weak self] in
                self?.show(cotegoryVC, sender: nil)
            }
            
            productListHeader.buttonPress = { [weak self] in
                let controller = storyboardContact.instantiateViewController(withIdentifier: "ContactVC")
                
                self?.navigationController?.pushViewController(contactVC, animated: true)
               // self?.navigationController?.pushViewController(contactVC, animated: true)
            }
  
          return productListHeader
        }
        return UICollectionReusableView.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("index 0")
        } else {
            print("index 1")
        }
    }
    
}


//let controller = storyboard.instantiateViewControllerWithIdentifier("HomeVC")
// self.navigationController!.pushViewController(controller)
