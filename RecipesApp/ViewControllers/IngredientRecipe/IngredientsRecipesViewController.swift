//
//  IngredientsRecipesViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class IngredientsRecipesViewController: UITableViewController {
    
    var recipes: [Recipe]!

    fileprivate let cellIdentifier = "recipeCell"
    
    

}

extension IngredientsRecipesViewController {
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeCell
        // config cell here
        // ...
        
        return cell
    }
    
    
}
