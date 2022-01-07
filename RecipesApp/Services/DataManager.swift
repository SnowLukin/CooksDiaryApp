//
//  Recipes.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    let firstRecipe = Recipe(name: "First Recipe",
                             description: "This is the first recipe on the list",
                             author: "System",
                             dairy: [.egg, .icecream])
    let secondRecipe = Recipe(name: "Second Recipe",
                              description: "This is the second recipe on the list",
                              author: "System",
                              alcohol: [.beer],
                              fruitsAndBarries: [.apple, .banana])
    let thirdRecipe = Recipe(name: "Third Recipe",
                             description: "This is the third recipe on the list",
                             author: "System",
                             fish: [.cod],
                             sweeteners: [.grenadine],
                             vegetables: [.carrot])
    let forthRecipe = Recipe(name: "Forth Recipe",
                             description: "This is the forth recipe on the list",
                             author: "System",
                             fish: [.anchovy, .cod],
                             seeds: [.chia])
    let fifthRecipe = Recipe(name: "Fifth Recipe",
                             description: "This is the fifth recipe on the list",
                             author: "System",
                             alcohol: [.gin],
                             beverages: [.appleJuice])
    
    var recipes: [Recipe] {
        [firstRecipe, secondRecipe, thirdRecipe, forthRecipe, fifthRecipe]
    }
    
    private init() {}
}
