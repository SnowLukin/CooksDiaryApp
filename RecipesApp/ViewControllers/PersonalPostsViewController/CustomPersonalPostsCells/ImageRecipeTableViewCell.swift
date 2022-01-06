//
//  ImageRecipeTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 06.01.2022.
//

import UIKit

class ImageRecipeTableViewCell: UITableViewCell {
    
    @IBOutlet var recipeImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
    }

    

}
