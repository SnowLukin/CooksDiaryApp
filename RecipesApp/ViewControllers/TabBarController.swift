//
//  ViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    var user: User!
    var recipes = Recipe.getRecipes()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareData()
    }
    
    private func shareData() {
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            guard let navVC = viewController as? UINavigationController else { return }
            
            if let rootVC = navVC.topViewController as? IngredientsRecipesViewController {
                rootVC.recipes = recipes
            }
            if let profileVC = navVC.topViewController as? SettingsTableViewController {
                profileVC.user = user
            }
        }
    }
    
}

