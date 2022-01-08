//
//  Extensions.swift
//  RecipesApp
//
//  Created by Snow Lukin on 04.01.2022.
//

import UIKit

// MARK: UIButton
extension UIButton {
    func setSegmentButton(title: String, textColor: UIColor, tag: Int) {
        self.tag = tag
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
}

// MARK: UIView
extension UIView {
    func setSegmentView(color: UIColor) {
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
}

// MARK: UIAlertController
extension UIAlertController {
    
    func setNeededFont() {
        let attributedString = NSAttributedString(string: self.message ?? "", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.gray
        ])
        
        self.setValue(attributedString, forKey: "attributedMessage")
    }
}

// MARK: UITextField
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 20, y: 0, width: 30, height: 30))
        iconView.image = image
       
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
