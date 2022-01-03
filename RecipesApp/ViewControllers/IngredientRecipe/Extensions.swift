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
