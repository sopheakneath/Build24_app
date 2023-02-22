//
//  PhotoCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 23/11/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
  
    
    var PressButton: (() -> Void)?
    @IBOutlet weak var uiImage: UIImageView!
   
    @IBAction func actionBtn(_ sender: Any) {
        PressButton?()
    }
    @IBOutlet var uiBtn: UIButton!
    
    @IBOutlet weak var viewcontroller: UIView!
    @IBOutlet weak var labelImage: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        labelImage.numberOfLines = 2
        viewcontroller.layer.cornerRadius = 35
        uiBtn.addTarget(self, action: #selector(goToScreen), for: .touchUpInside)
      
    }
    
    @objc func goToScreen(){
        PressButton?()
    }
    
   
}


