//
//  ViewController.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 8/12/22.
//

import UIKit
import Resolver
import RxSwift
import RxCocoa


class ProductByCategoryViewController: BaseVC , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   
    
    @IBAction func search(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let vcSearch = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        show(vcSearch, sender: nil)
    }
    @IBAction func test(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let vcSearch = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        show(vcSearch, sender: nil)
    }
    @Injected var viewModel : ProductDetailViewModel
    @Injected var categoryTypes : ProductByCategoryViewModel
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        collectionView.dataSource = self
        collectionView.delegate = self
        nibRegister()
        getCategoryType()
        
    }
    
    func nibRegister(){
        
        let nibCategoryCell = UINib(nibName: "TypeCategoryCollectionViewCell", bundle: nil)
        collectionView.register(nibCategoryCell, forCellWithReuseIdentifier: "TypeCategoryCollectionViewCell")
        let nipPic = UINib(nibName: "ProductPictureCollectionViewCell", bundle: nil)
        collectionView.register(nipPic, forCellWithReuseIdentifier: "pictureid")
        let nibHeader = UINib(nibName: "TypeCategoryCollectionReusableView", bundle: nil)
        collectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TypeCategoryCollectionReusableView")
        let nibAds = UINib(nibName: "AdsHeaderCollectionReusableView", bundle: nil)
        collectionView.register(nibAds, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AdsHeaderCollectionReusableView")
        let nibCell = UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
        
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
    }
    
    private func getProductList(){
        viewModel.reletedProductList()
            .observe(on: MainScheduler.instance)
            .subscribe { listByCategory in self.viewModel.productList = listByCategory }.disposed(by: disposeBag)
    }
    
    private func getCategoryType(){
        categoryTypes.categoryTypeList()
            .observe(on: MainScheduler.instance)
            .subscribe {
                listCategoryType in self.categoryTypes.categoryType = listCategoryType
            }.disposed(by: disposeBag)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categoryTypes.categoryType.count
        } else {
          //  return viewModel.productList.count
           return 5
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryType = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCategoryCollectionViewCell", for: indexPath) as!
        TypeCategoryCollectionViewCell
        let type = categoryTypes.categoryType[indexPath.section]
        categoryType.setUpData(with: type)
        
        let productList = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as! ProductDetailCollectionViewCell
        
//        let list = viewModel.productList[indexPath.row]
//        productList.setUpData(with: list)
       
        if indexPath.section == 0 {
            return categoryType
        } else {
            return productList
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TypeCategoryCollectionReusableView", for: indexPath) as! TypeCategoryCollectionReusableView
            return header
        } else {
            let headerAds = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AdsHeaderCollectionReusableView", for: indexPath) as! AdsHeaderCollectionReusableView
            return headerAds
        }
       return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = (view.frame.width / 4.1) - 10
            return CGSize(width:width, height: width)
        } else {
            let width = (view.frame.width / 2.2) - 5
           return CGSize(width: width, height: 250)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 310)
        } else {
            return CGSize(width: view.frame.width, height: 120)
        }
        return CGSize.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        } else {
            return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        }
        
        return UIEdgeInsets.init()
    }
    
    @objc func closeTab(){
        self.navigationController?.popViewController(animated: true)
    }
}



