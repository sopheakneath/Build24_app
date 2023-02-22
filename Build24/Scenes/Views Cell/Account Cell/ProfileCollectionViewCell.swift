//
//  ProfileCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 28/11/22.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var viewlabel: UIView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        viewlabel.layer.cornerRadius = 8
        // Initialization code
    }

}
