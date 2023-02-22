//
//  TypeCategoryCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 9/12/22.
//

import UIKit

class TypeCategoryCollectionViewCell: UICollectionViewCell  {
    
    var item : CategoryTypeModel!

    @IBOutlet var circleView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleView.layer.cornerRadius = self.frame.width / 2
    }
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var title: UILabel!
    
  
   
    
    func setUpData(with item: CategoryTypeModel){
        self.item = item
        image.image = UIImage(named: item.image) 
        title.text = item.title
    }
}

