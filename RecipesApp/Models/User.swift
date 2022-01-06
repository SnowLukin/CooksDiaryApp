//
//  User.swift
//  RecipesApp
//
//  Created by Snow Lukin on 30.12.2021.
//

import Foundation


class User {
    
    enum Sex {
        case male
        case female
    }
    
    var username: String
    var name: String
    var surname: String
    var bio: String
    var sex: Sex
    
    init(username: String, name: String?, surname: String?, bio: String?, sex: Sex) {
        self.username = username
        self.name = name ?? ""
        self.surname = surname ?? ""
        self.bio = bio ?? ""
        self.sex = sex
    }
    
}
