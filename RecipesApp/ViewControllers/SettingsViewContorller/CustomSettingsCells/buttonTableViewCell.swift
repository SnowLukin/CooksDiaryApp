//
//  ButtonTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 05.01.2022.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet var logOutButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        logOutButton.layer.cornerRadius = 10
    }
}
