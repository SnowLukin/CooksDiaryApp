//
//  RecipeInfoCellCell.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    var indexPath: IndexPath!
    var delegate: RecipeCellDelegate!
    
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
    
    // MARK: Override
    override func awakeFromNib() {
        super.awakeFromNib()
//        likeButton.tintColor = darkGreenColor
//        dishNameLabel.text = recipe.name
//        creatorLabel.text = recipe.author
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: IBActions
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.tintColor == darkGreenColor {
            sender.tintColor = customRedColor
        } else {
            sender.tintColor = darkGreenColor
        }
        delegate.likeRecipe(indexPath)
    }
}
