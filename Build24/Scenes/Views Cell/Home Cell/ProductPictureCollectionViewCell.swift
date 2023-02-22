//
//  ProductPictureCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 24/11/22.
//

import UIKit

class ProductPictureCollectionViewCell: UICollectionViewCell {
    
    var ButtonDidPress: (() -> Void)?
   
    @IBOutlet weak var btnOutlet: UIButton!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var uiImage: UIView!
    
    @IBAction func btn(_ sender: Any) {
     ButtonDidPress?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .brown
        btnOutlet.addTarget(self, action: #selector(goToScreen), for: .touchUpInside)
    }
    
    @objc func goToScreen() {
        ButtonDidPress?()
    }
    
   
}

