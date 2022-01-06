//
//  AddIngredientsViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import UIKit

class AddIngredientsViewController: UITableViewController {
    
    fileprivate let cellIdentifier = "ingredientCell"
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup sections
        sections = [
            Section(title: "Meats",
                    options: Ingredients.Meats.allCases.map({ $0.rawValue })),
            Section(title: "Vegetables",
                    options: Ingredients.Vegetables.allCases.map({ $0.rawValue })),
            Section(title: "Cheese",
                    options: Ingredients.Cheese.allCases.map({ $0.rawValue })),
            Section(title: "Dairy",
                    options: Ingredients.Dairy.allCases.map({ $0.rawValue })),
            Section(title: "Alcohol",
                    options: Ingredients.Alcohol.allCases.map({ $0.rawValue })),
            Section(title: "Fish",
                    options: Ingredients.Fish.allCases.map({ $0.rawValue })),
            Section(title: "Sweeteners",
                    options: Ingredients.Sweeteners.allCases.map({ $0.rawValue })),
            Section(title: "Fruits & Barries",
                    options: Ingredients.FruitsAndBarries.allCases.map({ $0.rawValue })),
            Section(title: "Sauces",
                    options: Ingredients.Sauces.allCases.map({ $0.rawValue })),
            Section(title: "Beverages",
                    options: Ingredients.Beverages.allCases.map({ $0.rawValue })),
            Section(title: "Desserts",
                    options: Ingredients.Desserts.allCases.map({ $0.rawValue })),
            Section(title: "Pasta",
                    options: Ingredients.Pasta.allCases.map({ $0.rawValue })),
            Section(title: "Seeds",
                    options: Ingredients.Seeds.allCases.map({ $0.rawValue }))
        ]
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
    }
}

// MARK: - Table view
extension AddIngredientsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return section.options.count + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.text = sections[indexPath.section].title
        } else {
            content.text = sections[indexPath.section].options[indexPath.row - 1]
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
}
