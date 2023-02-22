//
//  Product.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 6/12/22.
//

import UIKit
import Resolver
import RxSwift
import RxCocoa

class Product: BaseVC {

    @IBOutlet var collectionView: UICollectionView!
    
   
     @Injected var viewModel : ProductDetailViewModel

     
   
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .white
         self.tabBarController?.tabBar.isHidden = true
         
         let nib = UINib(nibName:"ProductDetailCollectionReusableView" , bundle: nil)
         collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProductDetailCollectionReusableView")
         
         let nibCell = UINib(nibName: "ProductDetailCollectionViewCell", bundle: nil)
         collectionView.register(nibCell, forCellWithReuseIdentifier: "ProductDetailCollectionViewCell")
         
     }
     
 //    private func setupLayout(){
 //        let layout = UICollectionViewFlowLayout()
 //        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 600)
 //        collectionView.setCollectionViewLayout(layout, animated: false)
 //    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as! ProductDetailCollectionViewCell
         
         return UICollectionViewCell()
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 0
     }
     
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
             let productListHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductDetailCollectionReusableView", for: indexPath) as! ProductDetailCollectionReusableView
             
         return productListHeader
     }
     
     
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.width, height : 1000 )
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 100)
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 100, height: 100)
         
     }


}
