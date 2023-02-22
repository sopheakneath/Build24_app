//
//  CategoryCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 15/12/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
   
    var item : categoryModel!
    var didPressed: (() -> Void)?
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonOutlet.addTarget(self, action: #selector(gotoScreen), for: .touchUpOutside)
        // Initialization code
    }
    @IBAction func buttonAction(_ sender: Any) {
        didPressed?()
    }
    
    func setUpData(with item: categoryModel){
        self.item = item
        title.text = item.title
    }
    
    @objc func gotoScreen(){
        didPressed?()
}


}
