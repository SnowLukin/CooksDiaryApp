//
//  TagsRecipeTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 06.01.2022.
//

import UIKit

class TagsRecipeTableViewCell: UITableViewCell {
    
    @IBOutlet var addTagButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)
        
        addTagButton.layer.cornerRadius = 10
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton!){
        
    }

    

}
