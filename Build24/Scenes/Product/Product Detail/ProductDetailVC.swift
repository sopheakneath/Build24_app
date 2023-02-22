//
//  ProductDetailVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import UIKit
import Resolver
import RxSwift
import RxCocoa

class ProductDetailVC: BaseVC , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource , UICollectionViewDelegate {
    
    @IBOutlet var buttomTabView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var header: UIView!
    
    @Injected var viewModel : ProductDetailViewModel
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.showsVerticalScrollIndicator = false
        BackButton(var: .white)
        
        let nib = UINib(nibName:"ProductDetailCollectionReusableView" , bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProductDetailCollectionReusableView")
        
        let nibCell = UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
        getCollectionData()
        dropShadowButtomTab()
       
    }
    
    @IBAction func backHome(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vcMain = storyboard.instantiateViewController(identifier: "MainVC") as! MainVC
//        show(vcMain, sender: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    func dropShadowButtomTab(scale: Bool = true) {
       // buttomTabView.layer.masksToBounds = false
        buttomTabView.layer.shadowColor = UIColor.black.cgColor
        buttomTabView.layer.shadowOpacity = 0.5
        buttomTabView.layer.shadowOffset = .zero
        buttomTabView.layer.shadowRadius = 5
       // buttomTabView.layer.shouldRasterize = true
       // buttomTabView.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    
    private func setupLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 600)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func getCollectionData() {
        viewModel.reletedProductList()
            .observe(on: MainScheduler.instance)
            .subscribe { products in
            self.viewModel.productList = products
        }.disposed(by: disposeBag)
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProduct = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as! ProductDetailCollectionViewCell
        let product = viewModel.productList[indexPath.row]
        
        cellProduct.setUpData(with: product)
        if product.isLike == true {
            cellProduct.btn.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            cellProduct.btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        return cellProduct
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        let productListHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductDetailCollectionReusableView", for: indexPath) as! ProductDetailCollectionReusableView
        viewModel.productDetails()
            .observe(on: MainScheduler.instance)
            .subscribe { details in
                
                productListHeader.setUpData(with: details)
            }.disposed(by: disposeBag)
            
        return productListHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.width, height: 1143)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2.2) - 5
        return CGSize(width: width, height: 250)
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        var offset = collectionView.contentOffset.y / 150
//        if offset > 0 {
//            navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green:0, blue: 225, alpha: offset)
//            header.tintColor = UIColor(red: 1, green:0, blue: 0, alpha: offset)
//            print("hi")
//
//        } else if offset <= 0 {
//            navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green:0 , blue: 0, alpha: 0)
//            header.tintColor = UIColor(red: 0, green:1, blue: 0, alpha: offset)
//
//            print("hello")
//        }
//    }

    
}
        
         



//private func bindViewModelToCollectionView(){
//    dataSource.supplementaryViewFactory = {(dataSource, collectionView, kind, indexPath) -> UICollectionReusableView in
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderReuseId", for: indexPath) as! HeaderCell
//        header.setup()
//        return header
//    }
//}
//
//deinit {
//    disposeBag = nil
//}
