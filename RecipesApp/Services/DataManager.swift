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
                             ingredientTags: [.appleSauce, .anchovy, .wine],
                             author: "System")
    let secondRecipe = Recipe(name: "Second Recipe",
                              description: "This is the second recipe on the list",
                              ingredientTags: [.pineapple, .appleSyrup, .beer],
                              author: "System")
    let thirdRecipe = Recipe(name: "Third Recipe",
                             description: "This is the third recipe on the list",
                             ingredientTags: [.caramel, .carrot, .fish],
                             author: "System")
    let forthRecipe = Recipe(name: "Forth Recipe",
                             description: "This is the forth recipe on the list",
                             ingredientTags: [.milkChocolate, .vodka],
                             author: "System")
    let fifthRecipe = Recipe(name: "Fifth Recipe",
                             description: "This is the fifth recipe on the list",
                             ingredientTags: [.butter, .creamcheese],
                             author: "System")
    
    var recipes: [Recipe] {
        [firstRecipe, secondRecipe, thirdRecipe, forthRecipe, fifthRecipe]
    }
    
    private init() {}
}
