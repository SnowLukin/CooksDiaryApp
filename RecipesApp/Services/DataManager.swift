//
//  Recipes.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    private let text = """
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mattis vulputate enim nulla aliquet porttitor lacus. Feugiat in ante metus dictum at tempor commodo. In vitae turpis massa sed elementum tempus. Purus faucibus ornare suspendisse sed nisi lacus sed viverra. Mauris ultrices eros in cursus turpis massa tincidunt. Et netus et malesuada fames ac. Pretium lectus quam id leo in vitae. Sem fringilla ut morbi tincidunt augue interdum velit euismod in. Sem fringilla ut morbi tincidunt.

                        Nunc faucibus a pellentesque sit amet porttitor eget dolor. Suspendisse ultrices gravida dictum fusce ut. Ut consequat semper viverra nam libero. Lobortis feugiat vivamus at augue eget arcu dictum varius duis. Varius vel pharetra vel turpis nunc eget lorem dolor. Massa ultricies mi quis hendrerit dolor. Cras adipiscing enim eu turpis egestas pretium. Tincidunt augue interdum velit euismod in pellentesque. Vitae purus faucibus ornare suspendisse sed nisi lacus. Auctor augue mauris augue neque gravida. Aliquam sem et tortor consequat id porta nibh venenatis cras. Magna eget est lorem ipsum. Eget nunc scelerisque viverra mauris in aliquam sem. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Fringilla urna porttitor rhoncus dolor purus non. Tempor orci eu lobortis elementum nibh. Bibendum at varius vel pharetra vel turpis nunc eget. Nisi lacus sed viverra tellus in hac habitasse platea dictumst. Aliquet sagittis id consectetur purus ut. Odio tempor orci dapibus ultrices.
                        """
    
    var firstRecipe = Recipe(name: "First Recipe",
                             description: "This is the first recipe on the list",
                             author: "System",
                             dairy: [.egg, .icecream])
    var secondRecipe = Recipe(name: "Second Recipe",
                              description: "This is the second recipe on the list",
                              author: "System",
                              alcohol: [.beer],
                              fruitsAndBarries: [.apple, .banana])
    var thirdRecipe = Recipe(name: "Third Recipe",
                             description: "This is the third recipe on the list",
                             author: "System",
                             fish: [.cod],
                             sweeteners: [.grenadine],
                             vegetables: [.carrot])
    var forthRecipe = Recipe(name: "Forth Recipe",
                             description: "This is the forth recipe on the list",
                             author: "System",
                             fish: [.anchovy, .cod],
                             seeds: [.chia])
    var fifthRecipe = Recipe(name: "Fifth Recipe",
                             description: "This is the fifth recipe on the list",
                             author: "System",
                             alcohol: [.gin],
                             beverages: [.appleJuice])
    
    var recipes: [Recipe] {
        var recipes = [firstRecipe, secondRecipe, thirdRecipe, forthRecipe, fifthRecipe]
        for index in recipes.startIndex..<recipes.endIndex {
            recipes[index].description = text
        }
        return recipes
    }
    
    private init() {}
}
