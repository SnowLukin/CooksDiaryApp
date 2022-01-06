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
    var ingredientTags: [Any]
    var isLiked: Bool = false
    
    init(name: String, description: String = "", ingredientTags: [Any] = [], author: String) {
        self.name = name
        self.description = description
        self.ingredientTags = ingredientTags
        self.author = author
    }
    
    static func getRecipes() -> [Recipe] {
        DataManager.shared.recipes
    }
}
