//
//  IngedientsList.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import Foundation


struct Ingredients {
    
    enum Meats: String, CaseIterable {
        case bacon = "Bacon"
        case beefSteak = "Beef steak"
        case ham = "Ham"
        case pork = "Pork"
        case sausage = "Sausage"
    }
    
    enum Vegetables: String, CaseIterable {
        case garlic = "Garlic"
        case onion = "Onion"
        case papper = "Papper"
        case tomato = "Tomato"
        case carrot = "Carrot"
        case patato = "Patato"
        case cucamber = "Cucamber"
        case mushroom = "Mushroom"
        case salad = "Salad"
        case corn = "Corn"
    }
    
    enum FruitsAndBarries: String, CaseIterable {
        case apple = "Apple"
        case lemon = "Lemon"
        case orange = "Orange"
        case lime = "Lime"
        case blueberry = "Blueberry"
        case pineapple = "Pineapple"
        case banana = "Banana"
        case peach = "Peach"
    }
    
    enum Dairy: String, CaseIterable {
        case butter = "Butter"
        case egg = "Egg"
        case milk = "Milk"
        case icecream = "Icecream"
    }
    
    enum Sweeteners: String, CaseIterable {
        case sugar = "Sugar"
        case brownSugar = "Brown sugar"
        case grenadine = "Grenadine"
        case vanillaSyrup = "Vanilla syrup"
        case appleSyrup = "Apple syrup"
    }
    
    enum Cheese: String, CaseIterable {
        case parmesan = "Parmesan"
        case cheddar = "Cheddar"
        case riccota = "Riccota"
        case creamcheese = "Cream cheese"
    }
   
    enum Sauces: String, CaseIterable {
        case soySauce = "Soy sauce"
        case hotSauce = "Hot sauce"
        case appleSauce = "Apple sauce"
        case chiliSauce = "Chili sauce"
        case tomatoSauce = "Tomato sauce"
        case mayoSauce = "Mayo sauce"
    }
    
    enum Seeds: String, CaseIterable {
        case almond = "Almond"
        case walnut = "Walnut"
        case pecan = "Pecan"
        case chia = "Chia"
        case flax = "Flax"
        case peanut = "Peanut"
    }
    
    enum Desserts: String, CaseIterable {
        case milkChocolate = "Milk chocolate"
        case darkChocolate = "Dark chocolate"
        case oreo = "Oreo"
        case marshmallow = "Marshmallow"
        case caramel = "Caramel"
        case nutella = "Nutella"
        case jam = "Jam"
        case candy = "Candy"
    }
    
    enum Alcohol: String, CaseIterable {
        case beer = "Beer"
        case wine = "Wine"
        case vodka = "Vodka"
        case whisky = "Whisky"
        case rum = "Rum"
        case gin = "Gin"
        case liqueur = "Liqueur"
    }
    
    enum Pasta: String, CaseIterable {
        case penne = "Penne"
        case spaphetti = "Spaphetti"
        case noodle = "Noodle"
        case lasagna = "Lasagna"
        case vermicelli = "Vermicelli"
    }
    
    enum Beverages: String, CaseIterable {
        case orangeJuice = "Orange juice"
        case coffee = "Coffee"
        case tea = "Tea"
        case appleJuice = "Apple juice"
        case juice = "Juice"
        case lemonade = "Lemonade"
        case kvass = "Kvass"
    }
    
    enum Fish: String, CaseIterable {
        case salmon = "Salmon"
        case tuna = "Tuna"
        case cod = "Cod"
        case anchovy = "Anchovy"
        case sardines = "Sardines"
    }
}
