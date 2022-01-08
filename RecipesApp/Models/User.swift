//
//  User.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import Foundation


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserLogin() -> User {
        User(login: "User", password: "!12345qwerty", person: Person.getPersonData())
    }
}

struct Person {
    
    enum Sex {
        case male
        case female
    }
    
    var name: String
    var surname: String
    var bio: String
    var sex: Sex
    
    static func getPersonData() -> Person {
        Person(name: "Name", surname: "Surname", bio: "Human", sex: Sex.male)
    }
    
}
