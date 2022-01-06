//
//  BioTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 05.01.2022.
//

import UIKit

class BioTableViewCell: UITableViewCell {
    
    @IBOutlet var bioLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
        
        bioLabel.textColor = .white
    }

    

}
