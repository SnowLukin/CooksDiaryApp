//
//  AddIngredientsViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import UIKit

class AddIngredientsViewController: UITableViewController {
    
    fileprivate let titleCellIdentifier = "ingredientTitleCell"
    fileprivate let optionCellIdentifier = "ingredientOptionCell"
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavBar()
        
        // Setup sections
        sections = [
            Section(title: "Meats",
                    options: Ingredients.Meats.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Vegetables",
                    options: Ingredients.Vegetables.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Cheese",
                    options: Ingredients.Cheese.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Dairy",
                    options: Ingredients.Dairy.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Alcohol",
                    options: Ingredients.Alcohol.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Fish",
                    options: Ingredients.Fish.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Sweeteners",
                    options: Ingredients.Sweeteners.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Fruits & Barries",
                    options: Ingredients.FruitsAndBarries.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Sauces",
                    options: Ingredients.Sauces.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Beverages",
                    options: Ingredients.Beverages.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Desserts",
                    options: Ingredients.Desserts.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Pasta",
                    options: Ingredients.Pasta.allCases.map({ OptionInSection($0.rawValue) })),
            Section(title: "Seeds",
                    options: Ingredients.Seeds.allCases.map({ OptionInSection($0.rawValue) }))
        ]
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true)
    }
}

// MARK: - Setting NavBar
extension AddIngredientsViewController {
    private func configNavBar() {
        
        let navBar = navigationController!.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.backgroundColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
        standardAppearance.backgroundImage = UIImage()
        standardAppearance.shadowImage = UIImage()

        let compactAppearance = standardAppearance.copy()

        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance
        navBar.compactScrollEdgeAppearance = compactAppearance
    }
}

// MARK: - Table view
extension AddIngredientsViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
    
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
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellIdentifier, for: indexPath)
            let currentSection = sections[indexPath.section]
            
            var content = cell.defaultContentConfiguration()
            content.textProperties.font = UIFont.boldSystemFont(ofSize: 20)
            content.textProperties.color = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
            content.text = currentSection.title
            content.secondaryText = "Chosen: \(currentSection.amountOfChosenOptions) ingedients."
            content.secondaryTextProperties.color = .white
            content.secondaryTextProperties.font = UIFont.boldSystemFont(ofSize: 15)
            cell.contentConfiguration = content
            
            // background color when selected
            let selectedView = UIView()
            selectedView.backgroundColor = .clear
            cell.selectedBackgroundView = selectedView
            selectedView.sizeToFit()
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: optionCellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let currentOption = sections[indexPath.section].options[indexPath.row - 1]
        content.text = currentOption.option
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
        content.textProperties.color = .black
        if currentOption.isChosen {
            cell.tintColor = .yellow
        } else {
            cell.tintColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
        }
        cell.contentConfiguration = content
        
        // background color when selected
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        cell.selectedBackgroundView = selectedView
        selectedView.sizeToFit()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            sections[indexPath.section].options[indexPath.row - 1].isChosen.toggle()
            tableView.reloadData()
        }
    }
}
