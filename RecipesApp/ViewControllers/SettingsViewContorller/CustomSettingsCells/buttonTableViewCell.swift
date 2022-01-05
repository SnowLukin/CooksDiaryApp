//
//  buttonTableViewCell.swift
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
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
        
    }
    

}
