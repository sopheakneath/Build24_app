//
//  FormCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 23/12/22.
//

import UIKit

class FormCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiview: UIView!
    @IBOutlet weak var category: UIView!
    @IBOutlet weak var title: UIView!
    @IBOutlet weak var Model: UIView!
    @IBOutlet weak var plateNumber: UIButton!
    @IBOutlet weak var taxPaper: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outLetStyle()
        // Initialization code
        
    }
    
    @IBAction func taxPaper(_ sender: Any) {
    }
    @IBAction func chooseCategory(_ sender: Any) {
    }
    @IBAction func plateNumber(_ sender: Any) {
    }
    
    func outLetStyle(){
        uiview.layer.cornerRadius = 10
        uiview.layer.borderWidth = 0.5
        category.layer.cornerRadius = 10
        category.layer.borderWidth = 0.5
        title.layer.cornerRadius = 10
        title.layer.borderWidth = 0.5
        Model.layer.cornerRadius = 10
        Model.layer.borderWidth = 0.5
//        plateNumber.layer.borderWidth = 0.5
//        plateNumber.layer.cornerRadius = 10
//        taxPaper.layer.borderWidth = 0.5
//        taxPaper.layer.cornerRadius = 10
    }

}
