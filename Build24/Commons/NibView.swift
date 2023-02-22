//
//  NibView.swift
//  Build24
//
//  Created by Sopheakneath.Phan on 13/12/22.
//


import UIKit

class NibView: UIView  {
    
    public func commitUI() {
        
    }
    
    private func loadViewFromNib() {
        if let className = NSStringFromClass(classForCoder)
            .components(separatedBy: ".")
            .last,
           let loadedView = Bundle.main
            .loadNibNamed(className, owner: self, options: nil)?
            .first as? UIView {
            loadedView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(loadedView)
            NSLayoutConstraint.activate([
                loadedView.topAnchor.constraint(equalTo: topAnchor),
                loadedView.leadingAnchor.constraint(equalTo: leadingAnchor),
                loadedView.trailingAnchor.constraint(equalTo: trailingAnchor),
                loadedView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        commitUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
        commitUI()
    }
}
