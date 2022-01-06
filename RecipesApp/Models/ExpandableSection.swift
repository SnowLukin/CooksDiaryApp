//
//  ExpandableSection.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import UIKit


class Section {
    let title: String
    let options: [String]
    var isOpened: Bool
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}
