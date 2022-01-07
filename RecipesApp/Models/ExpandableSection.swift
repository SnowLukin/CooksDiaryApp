//
//  ExpandableSection.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import UIKit


class Section {
    
    let title: String
    let options: [OptionInSection]
    var isOpened: Bool
    
    var amountOfChosenOptions: Int {
        options.filter({ $0.isChosen == true }).count
    }
    
    init(title: String, options: [OptionInSection], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class OptionInSection {
    var option: String
    var isChosen = false
    
    init(_ option: String) {
        self.option = option
    }
}
