//
//  ProductDetailCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 6/12/22.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    var item : RelatedProductModel!

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userView: UIView!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var postDate: UILabel!
    @IBOutlet var productPrice: UILabel!
  
    
    @IBOutlet var btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 5
        userImage.layer.cornerRadius = 17.5

    }

    @IBAction func forwardButton(_ sender: Any) {
    }

    @IBAction func heartButton(_ sender: Any) {
       
    }
    
    func setUpData(with item: RelatedProductModel) {
        self.item = item
        userImage.image = UIImage(named: item.userImage)
        userName.text = item.userName
        productImage.image = UIImage(named: item.productImage)
        productName.text = item.productName
        productPrice.text = item.prpductPrice
        postDate.text = item.postDate
       
    }
}
