//
//  TextFieldRecipeTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 06.01.2022.
//

import UIKit

class TextFieldRecipeTableViewCell: UITableViewCell {
    
    @IBOutlet var textFieldRecipe: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
    }
}

