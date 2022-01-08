//
//  User.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import Foundation


class User {
    
    var login: String
    var password: String
    var person: Person
    
    init(login: String, password: String, person: Person) {
        self.login = login
        self.password = password
        self.person = person
    }
    
    static func getUserLogin() -> [User] {
        [User(login: "test", password: "test", person: Person.getPersonData())]
    }
}

class Person {
    
    enum Sex {
        case male
        case female
    }
    
    var name: String
    var surname: String
    var bio: String
    var sex: Sex
    
    init(name: String, surname: String, bio: String = "", sex: Sex = .male) {
        self.name = name
        self.surname = surname
        self.bio = bio
        self.sex = sex
    }
    
    static func getPersonData() -> Person {
        Person(name: "Snow",
               surname: "Lukin",
               bio: "Personable line cook with 4+ years expertise in a fast-paced kitchen environment. Achieved region-best culinary satisfaction rating according to national food critic (5-Star Rating). Seeking to advance my culinary career by joining the Bahari Restaurant team as the new chef.",
               sex: .male)
    }
    
}
