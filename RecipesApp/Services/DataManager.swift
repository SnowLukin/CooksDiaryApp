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
                             ingredientTags: [Ingredients.Sauces.appleSauce,
                                              Ingredients.Fish.anchovy,
                                              Ingredients.Alcohol.wine],
                             author: "System")
    let secondRecipe = Recipe(name: "Second Recipe",
                              description: "This is the second recipe on the list",
                              ingredientTags: [Ingredients.FruitsAndBarries.pineapple,
                                               Ingredients.Sweeteners.appleSyrup,
                                               Ingredients.Alcohol.beer],
                              author: "System")
    let thirdRecipe = Recipe(name: "Third Recipe",
                             description: "This is the third recipe on the list",
                             ingredientTags: [Ingredients.Sweeteners.grenadine,
                                              Ingredients.Vegetables.carrot,
                                              Ingredients.Fish.cod],
                             author: "System")
    let forthRecipe = Recipe(name: "Forth Recipe",
                             description: "This is the forth recipe on the list",
                             ingredientTags: [Ingredients.Dairy.egg,
                                              Ingredients.Alcohol.vodka],
                             author: "System")
    let fifthRecipe = Recipe(name: "Fifth Recipe",
                             description: "This is the fifth recipe on the list",
                             ingredientTags: [Ingredients.Dairy.butter,
                                              Ingredients.Cheese.creamcheese],
                             author: "System")
    
    var recipes: [Recipe] {
        [firstRecipe, secondRecipe, thirdRecipe, forthRecipe, fifthRecipe]
    }
    
    private init() {}
}
