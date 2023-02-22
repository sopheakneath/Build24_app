//
//  ChatTableViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 30/11/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    var item: ChatModel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var discription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    func setupCell(with item : ChatModel) {
        self.item = item
        userName.text = item.userName
        discription.text = item.date
        profileImage.image = UIImage(named: item.profileImage)

    }
    
}
