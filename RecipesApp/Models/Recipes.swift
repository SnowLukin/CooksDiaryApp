//
//  Recipes.swift
//  Recipe
//
//  Created by Snow Lukin on 31.12.2021.
//

import Foundation


struct Recipe {
    
    enum Ingredients {
        // Meats
        case bacon
        case beefSteak
        case ham
        case pork
        case sausage
        
        // Vegetables
        case garlic
        case onion
        case papper
        case tomato
        case carrot
        case patato
        case cucamber
        case mushroom
        case salad
        case corn
        
        // Fruits & Barries
        case apple
        case lemon
        case orange
        case lime
        case blueberry
        case pineapple
        case banana
        case peach
        
        // Dairy
        case butter
        case egg
        case milk
        case icecream
        
        // Sweeteners
        case sugar
        case brownSugar
        case grenadine
        case vanillaSyrup
        case appleSyrup
        
        // Cheese
        case parmesan
        case cheddar
        case riccota
        case creamcheese
        
        // Sauces
        case soySauce
        case hotSauce
        case appleSauce
        case chiliSauce
        case tomatoSauce
        case mayoSauce
        
        // Seeds
        case almond
        case walnut
        case pecan
        case chia
        case flax
        case peanut
        
        // Desserts
        case milkChocolate
        case darkChocolate
        case oreo
        case marshmallow
        case caramel
        case nutella
        case jam
        case candy
        
        // Alcohol
        case beer
        case wine
        case vodka
        case whisky
        case rum
        case gin
        case liqueur
        
        // Pasta
        case pasta
        case penne
        case spaphetti
        case noodle
        case lasagna
        case vermicelli
        
        // Beverages
        case orangeJuice
        case coffee
        case tea
        case appleJuice
        case juice
        case lemonade
        case kvass
        
        // Fish
        case fish
        case salmon
        case tuna
        case cod
        case anchovy
        case sardines
    }
    
    var name: String
    var description: String
    var author: String
    
    var ingredientTags: [Ingredients]
    
    init(name: String, description: String?, ingredientTags: [Ingredients]?, author: String) {
        self.name = name
        self.description = description ?? ""
        self.ingredientTags = ingredientTags ?? []
        self.author = author
    }
    
    static func getRecipes() -> [Recipe] {
        
        DataManager.shared.recipes
        
    }
}
