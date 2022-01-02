//
//  IngredientsRecipesViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class IngredientsRecipesViewController: UITableViewController {
    
    var recipes: [Recipe]!
    
    let segmentalControl: UISegmentedControl = {
        let items = ["first", "second", "third"]
        let segmentalControl = UISegmentedControl(items: items)
        segmentalControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentalControl
    }()

    fileprivate let cellIdentifier = "recipeCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.titleView = segmentalControl
    }
    
    override func viewWillLayoutSubviews() {
        print("hello")
        segmentalControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentalControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for view in self.navigationController?.navigationBar.subviews ?? [] {
            let subviews = view.subviews
            if subviews.count > 0, let label = subviews[0] as? UILabel {
                label.textColor = UIColor.white
                label.font = UIFont.boldSystemFont(ofSize: 18)
            }
        }
    }
    
    

}

extension IngredientsRecipesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
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
