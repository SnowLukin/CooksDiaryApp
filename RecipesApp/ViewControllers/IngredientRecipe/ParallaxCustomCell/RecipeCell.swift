//
//  RecipeInfoCellCell.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet var starsImages: [UIImageView]!
    @IBOutlet weak var reviewValueLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    
    @IBOutlet weak var dishImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//        if selected {
//            contentView.backgroundColor = UIColor(red: 0.063, green: 0.436, blue: 0.298, alpha: 1)
//        } else {
//            contentView.backgroundColor = UIColor(red: 0.365, green: 0.604, blue: 0.298, alpha: 1)
//        }
    }
    
    

}
