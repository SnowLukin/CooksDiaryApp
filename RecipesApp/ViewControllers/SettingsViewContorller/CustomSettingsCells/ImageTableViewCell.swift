//
//  ImageTableViewCell.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 05.01.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        userImageView.layer.masksToBounds = false
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
}
