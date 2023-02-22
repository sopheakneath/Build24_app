//
//  FormTextFieldCollectionViewCell.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 28/12/22.
//

import UIKit

protocol CollectionCellTextFieldDelegate: class {
    func textDidChanged(_ textField: UITextField)
}


class FormTextFieldCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textField: UITextField!
    weak var textFieldDelegate: CollectionCellTextFieldDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        guard let textFieldDelegate = textFieldDelegate else { return }
    }
    
    func setUpField(){
        textField.returnKeyType = .go
    }

}
