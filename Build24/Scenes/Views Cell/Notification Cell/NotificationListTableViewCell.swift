//
//  NotificationListTableViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 30/11/22.
//

import UIKit

class NotificationListTableViewCell: UITableViewCell {
  
    var item: NotificationModel!
   
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var shortDiscription: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var statusNotification: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        viewCell.layer.cornerRadius = 8
        // Initialization code
    }
    
    func setupCell(with item: NotificationModel) {
        self.item = item
        shortDiscription.text = item.title
        statusNotification.text = item.id
        icon.image = UIImage(named: item.image)
        
    }
    
}
