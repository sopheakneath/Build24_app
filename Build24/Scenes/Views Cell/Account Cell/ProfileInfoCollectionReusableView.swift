//
//  ProfileInfoCollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 28/11/22.
//

import UIKit

class ProfileInfoCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var numFollowing: UILabel!
    @IBOutlet weak var coverPofile: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var numFollower: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var QRScan: UIButton!
    
    var didPress: (() -> Void)?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        QRScan.addTarget(self, action: #selector(test), for: .touchUpInside)
        //QRScan.addTarget(self, action: #selector(gotoQr), for: .touchUpInside)
    }
    
    func setUpdata(with item : Result){
        profileImage.image = UIImage(named: item.picture?.medium ?? "ownUser")
        lastName.text = item.name?.last
        email.text = item.email
       
    }
    
    @objc func test(){
        didPress?()
    }
    
    @objc func gotoQr(){
        didPress?()
    }
    
    @IBAction func gotoQr(_ sender: Any) {
       didPress?()
    }
}
