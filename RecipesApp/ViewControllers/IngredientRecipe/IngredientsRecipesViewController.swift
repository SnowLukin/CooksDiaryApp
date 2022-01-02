//
//  IngredientsRecipesViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class IngredientsRecipesViewController: UITableViewController, UIBarPositioningDelegate {
    
    var recipes: [Recipe]!
    
    let segmentalControl: UISegmentedControl = {
        let items = ["Recipes", "Popular", "Favorites"]
        let segmentalControl = UISegmentedControl(items: items)
        segmentalControl.selectedSegmentIndex = 0
        segmentalControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentalControl
    }()
    
    fileprivate let cellIdentifier = "recipeCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = segmentalControl
    }
    
    override func viewWillLayoutSubviews() {
        setSegmentalControlConstrints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarPromptFont()
    }
    
}

extension IngredientsRecipesViewController {
    
    private func setNavigationBarPromptFont() {
        for view in navigationController?.navigationBar.subviews ?? [] {
            let subviews = view.subviews
            if subviews.count > 0, let label = subviews[0] as? UILabel {
                label.textColor = UIColor.white
                label.font = UIFont.boldSystemFont(ofSize: 18)
            }
        }
    }
    
    private func setSegmentalControlConstrints() {
        segmentalControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentalControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentalControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
    }
}

// MARK: TableView
extension IngredientsRecipesViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }
    
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        50
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeCell
        
        // background color when selected
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0.063, green: 0.436, blue: 0.298, alpha: 1)
        cell.selectedBackgroundView = selectedView
        selectedView.sizeToFit()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
