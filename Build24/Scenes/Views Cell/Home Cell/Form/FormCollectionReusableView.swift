//
//  CollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 24/12/22.
//

import UIKit



class FormCollectionReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var imageView: UIView!
   
    @IBOutlet weak var categoryField: UIView!
    
    @IBOutlet weak var titleField: UIButton!
    

    
    @IBOutlet weak var categoryAction: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styling()
        // Initialization code
    }
    
    func styling(){
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        categoryField.layer.cornerRadius = 10
        categoryField.layer.borderWidth = 0.5
      

    }
    
    
    
}


