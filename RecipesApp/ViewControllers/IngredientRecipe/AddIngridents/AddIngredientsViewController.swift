//
//  AddIngredientsViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 06.01.2022.
//

import UIKit

class AddIngredientsViewController: UITableViewController {
    
    
    var delegate: AddIngredientsDelegate!
    
    fileprivate let titleCellIdentifier = "ingredientTitleCell"
    fileprivate let optionCellIdentifier = "ingredientOptionCell"
    private var sections = [Section]()
    
    private var alcohol: [Ingredients.Alcohol] = []
    private var beverages: [Ingredients.Beverages] = []
    private var cheese: [Ingredients.Cheese] = []
    private var dairy: [Ingredients.Dairy] = []
    private var desserts: [Ingredients.Desserts] = []
    private var fish: [Ingredients.Fish] = []
    private var sweeteners: [Ingredients.Sweeteners] = []
    private var seeds: [Ingredients.Seeds] = []
    private var sauces: [Ingredients.Sauces] = []
    private var pasta: [Ingredients.Pasta] = []
    private var meats: [Ingredients.Meats] = []
    private var fruitsAndBarries: [Ingredients.FruitsAndBarries] = []
    private var vegetables: [Ingredients.Vegetables] = []
    
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
        delegate.setRecipesForIngredients(alcohol: alcohol,
                                          beverages: beverages,
                                          cheese: cheese,
                                          dairy: dairy,
                                          desserts: desserts,
                                          fish: fish,
                                          sweeteners: sweeteners,
                                          seeds: seeds,
                                          sauces: sauces,
                                          pasta: pasta,
                                          meats: meats,
                                          fruitsAndBarries: fruitsAndBarries,
                                          vegetables: vegetables)
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
            let flag = sections[indexPath.section].options[indexPath.row - 1].isChosen
            print(indexPath.row)
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 1:
                    if flag {
                        meats.append(.bacon)
                    } else {
                        meats = meats.filter({ $0 != .bacon})
                    }
                case 2:
                    if flag {
                        meats.append(.beefSteak)
                    } else {
                        meats = meats.filter({ $0 != .beefSteak})
                    }
                case 3:
                    if flag {
                        meats.append(.ham)
                    } else {
                        meats = meats.filter({ $0 != .ham})
                    }
                case 4:
                    if flag {
                        meats.append(.pork)
                    } else {
                        meats = meats.filter({ $0 != .pork})
                    }
                default:
                    if flag {
                        meats.append(.sausage)
                    } else {
                        meats = meats.filter({ $0 != .sausage})
                    }
                }
            case 1:
                switch indexPath.row {
                case 1:
                    if flag {
                        vegetables.append(.garlic)
                    } else {
                        vegetables = vegetables.filter({ $0 != .garlic})
                    }
                case 2:
                    if flag {
                        vegetables.append(.onion)
                    } else {
                        vegetables = vegetables.filter({ $0 != .onion})
                    }
                case 3:
                    if flag {
                        vegetables.append(.papper)
                    } else {
                        vegetables = vegetables.filter({ $0 != .papper})
                    }
                case 4:
                    if flag {
                        vegetables.append(.tomato)
                    } else {
                        vegetables = vegetables.filter({ $0 != .tomato})
                    }
                case 5:
                    if flag {
                        vegetables.append(.carrot)
                    } else {
                        vegetables = vegetables.filter({ $0 != .carrot})
                    }
                case 6:
                    if flag {
                        vegetables.append(.patato)
                    } else {
                        vegetables = vegetables.filter({ $0 != .patato})
                    }
                case 7:
                    if flag {
                        vegetables.append(.cucamber)
                    } else {
                        vegetables = vegetables.filter({ $0 != .cucamber})
                    }
                case 8:
                    if flag {
                        vegetables.append(.mushroom)
                    } else {
                        vegetables = vegetables.filter({ $0 != .mushroom})
                    }
                case 9:
                    if flag {
                        vegetables.append(.salad)
                    } else {
                        vegetables = vegetables.filter({ $0 != .salad})
                    }
                default:
                    if flag {
                        vegetables.append(.corn)
                    } else {
                        vegetables = vegetables.filter({ $0 != .corn})
                    }
                }
            case 2:
                switch indexPath.row {
                case 1:
                    if flag {
                        cheese.append(.parmesan)
                    } else {
                        cheese = cheese.filter({ $0 != .parmesan})
                    }
                case 2:
                    if flag {
                        cheese.append(.cheddar)
                    } else {
                        cheese = cheese.filter({ $0 != .cheddar})
                    }
                case 3:
                    if flag {
                        cheese.append(.riccota)
                    } else {
                        cheese = cheese.filter({ $0 != .riccota})
                    }
                default:
                    if flag {
                        cheese.append(.creamcheese)
                    } else {
                        cheese = cheese.filter({ $0 != .creamcheese})
                    }
                }
            case 3:
                switch indexPath.row {
                case 1:
                    if flag {
                        dairy.append(.butter)
                    } else {
                        dairy = dairy.filter({ $0 != .butter})
                    }
                case 2:
                    if flag {
                        dairy.append(.egg)
                    } else {
                        dairy = dairy.filter({ $0 != .egg})
                    }
                case 3:
                    if flag {
                        dairy.append(.milk)
                    } else {
                        dairy = dairy.filter({ $0 != .milk})
                    }
                default:
                    if flag {
                        dairy.append(.icecream)
                    } else {
                        dairy = dairy.filter({ $0 != .icecream})
                    }
                }
            case 4:
                switch indexPath.row {
                case 1:
                    if flag {
                        alcohol.append(.beer)
                    } else {
                        alcohol = alcohol.filter({ $0 != .beer})
                    }
                case 2:
                    if flag {
                        alcohol.append(.wine)
                    } else {
                        alcohol = alcohol.filter({ $0 != .wine})
                    }
                case 3:
                    if flag {
                        alcohol.append(.vodka)
                    } else {
                        alcohol = alcohol.filter({ $0 != .vodka})
                    }
                case 4:
                    if flag {
                        alcohol.append(.whisky)
                    } else {
                        alcohol = alcohol.filter({ $0 != .whisky})
                    }
                case 5:
                    if flag {
                        alcohol.append(.rum)
                    } else {
                        alcohol = alcohol.filter({ $0 != .rum})
                    }
                case 6:
                    if flag {
                        alcohol.append(.gin)
                    } else {
                        alcohol = alcohol.filter({ $0 != .gin})
                    }
                default:
                    if flag {
                        alcohol.append(.liqueur)
                    } else {
                        alcohol = alcohol.filter({ $0 != .liqueur})
                    }
                }
            case 5:
                switch indexPath.row {
                case 1:
                    if flag {
                        fish.append(.salmon)
                    } else {
                        fish = fish.filter({ $0 != .salmon})
                    }
                case 2:
                    if flag {
                        fish.append(.tuna)
                    } else {
                        fish = fish.filter({ $0 != .tuna})
                    }
                case 3:
                    if flag {
                        fish.append(.cod)
                    } else {
                        fish = fish.filter({ $0 != .cod})
                    }
                case 4:
                    if flag {
                        fish.append(.anchovy)
                    } else {
                        fish = fish.filter({ $0 != .anchovy})
                    }
                default:
                    if flag {
                        fish.append(.sardines)
                    } else {
                        fish = fish.filter({ $0 != .sardines})
                    }
                }
            case 6:
                switch indexPath.row {
                case 1:
                    if flag {
                        sweeteners.append(.sugar)
                    } else {
                        sweeteners = sweeteners.filter({ $0 != .sugar})
                    }
                case 2:
                    if flag {
                        sweeteners.append(.brownSugar)
                    } else {
                        sweeteners = sweeteners.filter({ $0 != .brownSugar})
                    }
                case 3:
                    if flag {
                        sweeteners.append(.grenadine)
                    } else {
                        sweeteners = sweeteners.filter({ $0 != .grenadine})
                    }
                case 4:
                    if flag {
                        sweeteners.append(.vanillaSyrup)
                    } else {
                        sweeteners = sweeteners.filter({ $0 != .vanillaSyrup})
                    }
                default:
                    if flag {
                        sweeteners.append(.appleSyrup)
                    } else {
                        sweeteners = sweeteners.filter({ $0 != .appleSyrup})
                    }
                }
            case 7:
                switch indexPath.row {
                case 1:
                    if flag {
                        fruitsAndBarries.append(.apple)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .apple})
                    }
                case 2:
                    if flag {
                        fruitsAndBarries.append(.lemon)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .lemon})
                    }
                case 3:
                    if flag {
                        fruitsAndBarries.append(.orange)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .orange})
                    }
                case 4:
                    if flag {
                        fruitsAndBarries.append(.lime)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .lime})
                    }
                case 5:
                    if flag {
                        fruitsAndBarries.append(.blueberry)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .blueberry})
                    }
                case 6:
                    if flag {
                        fruitsAndBarries.append(.pineapple)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .pineapple})
                    }
                case 7:
                    if flag {
                        fruitsAndBarries.append(.banana)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .banana})
                    }
                default:
                    if flag {
                        fruitsAndBarries.append(.peach)
                    } else {
                        fruitsAndBarries = fruitsAndBarries.filter({ $0 != .peach})
                    }
                }
            case 8:
                switch indexPath.row {
                case 1:
                    if flag {
                        sauces.append(.soySauce)
                    } else {
                        sauces = sauces.filter({ $0 != .soySauce})
                    }
                case 2:
                    if flag {
                        sauces.append(.hotSauce)
                    } else {
                        sauces = sauces.filter({ $0 != .hotSauce})
                    }
                case 3:
                    if flag {
                        sauces.append(.appleSauce)
                    } else {
                        sauces = sauces.filter({ $0 != .appleSauce})
                    }
                case 4:
                    if flag {
                        sauces.append(.chiliSauce)
                    } else {
                        sauces = sauces.filter({ $0 != .chiliSauce})
                    }
                case 5:
                    if flag {
                        sauces.append(.tomatoSauce)
                    } else {
                        sauces = sauces.filter({ $0 != .tomatoSauce})
                    }
                default:
                    if flag {
                        sauces.append(.mayoSauce)
                    } else {
                        sauces = sauces.filter({ $0 != .mayoSauce})
                    }
                }
            case 9:
                switch indexPath.row {
                case 1:
                    if flag {
                        beverages.append(.orangeJuice)
                    } else {
                        beverages = beverages.filter({ $0 != .orangeJuice})
                    }
                case 2:
                    if flag {
                        beverages.append(.coffee)
                    } else {
                        beverages = beverages.filter({ $0 != .coffee})
                    }
                case 3:
                    if flag {
                        beverages.append(.tea)
                    } else {
                        beverages = beverages.filter({ $0 != .tea})
                    }
                case 4:
                    if flag {
                        beverages.append(.appleJuice)
                    } else {
                        beverages = beverages.filter({ $0 != .appleJuice})
                    }
                case 5:
                    if flag {
                        beverages.append(.juice)
                    } else {
                        beverages = beverages.filter({ $0 != .juice})
                    }
                case 6:
                    if flag {
                        beverages.append(.lemonade)
                    } else {
                        beverages = beverages.filter({ $0 != .lemonade})
                    }
                default:
                    if flag {
                        beverages.append(.kvass)
                    } else {
                        beverages = beverages.filter({ $0 != .kvass})
                    }
                }
            case 10:
                switch indexPath.row {
                case 1:
                    if flag {
                        desserts.append(.milkChocolate)
                    } else {
                        desserts = desserts.filter({ $0 != .milkChocolate})
                    }
                case 2:
                    if flag {
                        desserts.append(.darkChocolate)
                    } else {
                        desserts = desserts.filter({ $0 != .darkChocolate})
                    }
                case 3:
                    if flag {
                        desserts.append(.oreo)
                    } else {
                        desserts = desserts.filter({ $0 != .oreo})
                    }
                case 4:
                    if flag {
                        desserts.append(.marshmallow)
                    } else {
                        desserts = desserts.filter({ $0 != .marshmallow})
                    }
                case 5:
                    if flag {
                        desserts.append(.caramel)
                    } else {
                        desserts = desserts.filter({ $0 != .caramel})
                    }
                case 6:
                    if flag {
                        desserts.append(.nutella)
                    } else {
                        desserts = desserts.filter({ $0 != .nutella})
                    }
                case 7:
                    if flag {
                        desserts.append(.jam)
                    } else {
                        desserts = desserts.filter({ $0 != .jam})
                    }
                default:
                    if flag {
                        desserts.append(.candy)
                    } else {
                        desserts = desserts.filter({ $0 != .candy})
                    }
                }
            case 11:
                switch indexPath.row {
                case 1:
                    if flag {
                        pasta.append(.penne)
                    } else {
                        pasta = pasta.filter({ $0 != .penne})
                    }
                case 2:
                    if flag {
                        pasta.append(.spaphetti)
                    } else {
                        pasta = pasta.filter({ $0 != .spaphetti})
                    }
                case 3:
                    if flag {
                        pasta.append(.noodle)
                    } else {
                        pasta = pasta.filter({ $0 != .noodle})
                    }
                case 4:
                    if flag {
                        pasta.append(.lasagna)
                    } else {
                        pasta = pasta.filter({ $0 != .lasagna})
                    }
                default:
                    if flag {
                        pasta.append(.vermicelli)
                    } else {
                        pasta = pasta.filter({ $0 != .vermicelli})
                    }
                }
            default:
                switch indexPath.row {
                case 1:
                    if flag {
                        seeds.append(.almond)
                    } else {
                        seeds = seeds.filter({ $0 != .almond})
                    }
                case 2:
                    if flag {
                        seeds.append(.walnut)
                    } else {
                        seeds = seeds.filter({ $0 != .walnut})
                    }
                case 3:
                    if flag {
                        seeds.append(.pecan)
                    } else {
                        seeds = seeds.filter({ $0 != .pecan})
                    }
                case 4:
                    if flag {
                        seeds.append(.chia)
                    } else {
                        seeds = seeds.filter({ $0 != .chia})
                    }
                case 5:
                    if flag {
                        seeds.append(.flax)
                    } else {
                        seeds = seeds.filter({ $0 != .flax})
                    }
                default:
                    if flag {
                        seeds.append(.peanut)
                    } else {
                        seeds = seeds.filter({ $0 != .peanut})
                    }
                }
            }
            tableView.reloadData()
        }
    }
}
