//
//  CategoryVC.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 13/12/22.
//

import UIKit
import Resolver
import RxSwift
import RxCocoa

class CategoryVC:  BaseVC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @Injected var viewModel : CategoryViewModel
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        getData()
    }
    
   private func getData() {
        viewModel.fetchList()
            .observe(on: MainScheduler.instance)
            .subscribe{ categories in
                self.viewModel.categorylist = categories
                print("categoryResponse: \(self.viewModel.categorylist)")
                self.collectionView.reloadData()
            }.disposed(by: disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categorylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let category = viewModel.categorylist[indexPath.item]
        cell.setUpData(with: category)
        cell.didPressed = { [weak self] in
            let storyboard = UIStoryboard(name: "CategoryProductPost", bundle: nil)
            let contactVC = storyboard.instantiateViewController(withIdentifier: "CategoryProductPostVC") as! CategoryProductPostVC
            contactVC.hidesBottomBarWhenPushed = true
            self?.show(contactVC, sender: nil)

        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CategoryProductPost", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CategoryProductPostVC") as! CategoryProductPostVC
        show(vc, sender: nil)
    }
    
}



