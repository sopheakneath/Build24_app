//
//  TimeCollectionReusableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 14/12/22.
//

import UIKit

class TimeCollectionReusableView: UICollectionReusableView {
    
    var didPressed : (()-> Void)?
    @IBOutlet weak var OutletButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        OutletButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    @IBAction func actionButton(_ sender: Any) {
        didPressed?()
    }
    
    @objc func pressed(){
        didPressed?()
    }
}
