//
//  HeaderProfileCollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 29/12/22.
//

import UIKit

class HeaderProfileCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var didPress: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = 55/2
        btnProfile.addTarget(self, action: #selector(onpress), for: .touchUpInside)
    }
    
    @objc func onpress(){
        didPress?()
    }
    
    func setUpdata(with item : Result){
        image.image = UIImage(named: item.picture?.medium ?? "ownUser")
        name.text = item.name?.first
        email.text = item.email
    }
    
    
}


