//
//  RecipeInfoCellCell.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    var recipes: [Recipe]!
    var index: Int!
    
    // MARK: IBOutlets
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet var starsImages: [UIImageView]!
    @IBOutlet weak var reviewValueLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: Properties
    let darkGreenColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
    let customRedColor = UIColor(red: 0.823, green: 0.095, blue: 0.017, alpha: 1)
    
    // MARK: IBActions
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.tintColor == darkGreenColor {
            sender.tintColor = customRedColor
            recipes[index].isLiked = true
        } else {
            sender.tintColor = darkGreenColor
            recipes[index].isLiked = false
        }
    }
}
