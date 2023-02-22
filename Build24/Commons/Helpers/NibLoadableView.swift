//
//  NibLoadableView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 27/1/23.
//

import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String {get}
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    func loadNib() {
        let contentView = viewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth , UIView.AutoresizingMask.flexibleHeight]
        addSubview(contentView)
    }
    
    func viewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
