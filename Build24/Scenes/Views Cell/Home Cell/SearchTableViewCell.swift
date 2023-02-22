//
//  SearchTableViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 5/12/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var item : SearchModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func editSesrch(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellSetup(with item : SearchModel) {
        self.item = item
        titleLabel.text = item.searchTitle
    }
    
}
