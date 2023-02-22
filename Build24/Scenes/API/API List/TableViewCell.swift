//
//  TableViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 20/12/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var item : categoryModel!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(with item : categoryModel) {
        self.item = item
        title.text = item.title
    }
}


