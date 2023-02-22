//
//  CollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 6/12/22.
//

import UIKit
import Kingfisher

class ProductDetailCollectionReusableView: UICollectionReusableView  {

    var item : ProductDetailModel!
    @IBOutlet weak var productLocation: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    
    @IBOutlet weak var bannerimage: UIImageView!
    // product discription
    
    @IBOutlet weak var viewer: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var discription: UITextView!
    
    @IBOutlet var category: UILabel!
    override func awakeFromNib() {
     
        super.awakeFromNib()
      
        
        // Initialization code
    }
    
    func setUpData(with item: ProductDetailModel) {
       
        self.item = item
        var ids = String(item.id)
        var viewers = String(item.viewer)
        var like = String(item.likeCount)
        productName.text = item.productName
        productLocation.text = item.productLocation
        productPrice.text = item.productPrice
        userImg.image = UIImage(named: item.userImage)
        userName.text = item.userName
        userEmail.text = item.userEmail
        id.text = ids
        viewer.text = viewers
        likeCount.text = like
        discription.text = item.discription
        category.text = item.category
    }
}

