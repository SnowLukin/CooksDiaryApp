//
//  Recipes.swift
//  Recipe
//
//  Created by Snow Lukin on 31.12.2021.
//

import Foundation

struct Recipe {
    
    var name: String
    var description: String
    var author: String
    
    var alcohol: [Ingredients.Alcohol]
    var beverages: [Ingredients.Beverages]
    var cheese: [Ingredients.Cheese]
    var dairy: [Ingredients.Dairy]
    var desserts: [Ingredients.Desserts]
    var fish: [Ingredients.Fish]
    var sweeteners: [Ingredients.Sweeteners]
    var seeds: [Ingredients.Seeds]
    var sauces: [Ingredients.Sauces]
    var pasta: [Ingredients.Pasta]
    var meats: [Ingredients.Meats]
    var fruitsAndBarries: [Ingredients.FruitsAndBarries]
    var vegetables: [Ingredients.Vegetables]
    
    var ingredientTags: [Any] = [
        
    ]
    
    var isLiked: Bool = false
    
    init(name: String, description: String = "", author: String,
         alcohol: [Ingredients.Alcohol] = [],
         beverages: [Ingredients.Beverages] = [],
         cheese: [Ingredients.Cheese] = [],
         dairy: [Ingredients.Dairy] = [],
         desserts: [Ingredients.Desserts] = [],
         fish: [Ingredients.Fish] = [],
         sweeteners: [Ingredients.Sweeteners] = [],
         seeds: [Ingredients.Seeds] = [],
         sauces: [Ingredients.Sauces] = [],
         pasta: [Ingredients.Pasta] = [],
         meats: [Ingredients.Meats] = [],
         fruitsAndBarries: [Ingredients.FruitsAndBarries] = [],
         vegetables: [Ingredients.Vegetables] = []) {
        
        self.name = name
        self.description = description
        self.author = author
        
        self.alcohol = alcohol
        self.beverages = beverages
        self.cheese = cheese
        self.dairy = dairy
        self.desserts = desserts
        self.fish = fish
        self.sweeteners = sweeteners
        self.seeds = seeds
        self.sauces = sauces
        self.pasta = pasta
        self.meats = meats
        self.fruitsAndBarries = fruitsAndBarries
        self.vegetables = vegetables
    }
    
    static func getRecipes() -> [Recipe] {
        DataManager.shared.recipes
    }
}
