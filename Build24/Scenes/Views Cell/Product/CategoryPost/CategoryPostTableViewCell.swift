//
//  CategoryPostTableViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 20/12/22.
//

import UIKit


class CategoryPostTableViewCell: UITableViewCell {
    
    // var item : CategoryTypeModel!
    var item : categoryModel!
    var didPressed: (() -> Void)?

    @IBAction func buttonAction(_ sender: Any) {
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var buttonOutLet: UIButton!
    @IBOutlet weak var uiImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonOutLet.addTarget(self, action: #selector(gotoScreen), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpData(with item: categoryModel){
        self.item = item
        title.text = item.title
     
        
    }
    
    @objc func gotoScreen(){
        didPressed?()
    }
    
}
