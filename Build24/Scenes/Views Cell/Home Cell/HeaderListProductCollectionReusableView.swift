//
//  HeaderListProductCollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 24/11/22.
//

import UIKit

class HeaderListProductCollectionReusableView: UICollectionReusableView {
    
    var buttonPress: (()-> Void)?
    var didPressSelling: (() -> Void)?
    
    @IBOutlet weak var bannerOutlet: UIButton!
    @IBOutlet weak var bannerButton: UIButton!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var sellingButtonOutlet: UIButton!
    @IBAction func sellingButton(_ sender: Any) {

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonPress?()
        bannerButton.addTarget(self, action: #selector(goToScreen), for: .touchUpInside)
        sellingButtonOutlet.addTarget(self, action: #selector(goToSelling), for: .touchUpInside)
    }
   
    @objc func goToScreen(){
        buttonPress?()
    }
    
    @objc func goToSelling(){
        didPressSelling?()
    }
}

