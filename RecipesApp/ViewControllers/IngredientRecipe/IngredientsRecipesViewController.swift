//
//  IngredientsRecipesViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class IngredientsRecipesViewController: UITableViewController, UIBarPositioningDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var addIngedientsButton: UIButton!
    
    // MARK: Properties
    var recipes: [Recipe]!
    var filteredRecipes = [Recipe]()
    var favoriteRecipes = [Recipe]()
    
    
    let firstSegmentButton = UIButton()
    let firstSegmentView = UIView()
    let secondSegmentButton = UIButton()
    let secondSegmentView = UIView()
    
    let newView = UIView()
    
    let noCellsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Add ingedients to see recipes.\nTo add ingredients tap button in the top right corner."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.145, green: 0.332, blue: 0.125, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        
        return label
    }()
    
    let searchController = UISearchController()
    
    fileprivate let cellIdentifier = "recipeCell"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addIngedientsButton.layer.cornerRadius = 10
        
        filteredRecipes = recipes
        navigationItem.searchController = searchController
        view.addSubview(noCellsLabel)
        createMenuBar()
    }
    
    override func viewWillLayoutSubviews() {
        noCellsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noCellsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        noCellsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        noCellsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // to preventing NavBar from glitching for a sec
        // after going to next view
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavBar()
        navigationController?.navigationBar.isHidden = false
    }
    
}

// MARK: - Setting NavBar
extension IngredientsRecipesViewController {
    private func configNavBar() {
        
        let navBar = navigationController!.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.backgroundColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
        standardAppearance.backgroundImage = UIImage()
        standardAppearance.shadowImage = UIImage()
        
        // remove line under navbar
        standardAppearance.shadowColor = .clear
        standardAppearance.shadowImage = UIImage()
        

        let compactAppearance = standardAppearance.copy()

        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance
        navBar.compactScrollEdgeAppearance = compactAppearance
    }
}


// MARK: - Setting MenuBar
extension IngredientsRecipesViewController {
    
    @objc func segmentButtonClicked(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            sender.setTitleColor(.white, for: .normal)
            firstSegmentView.backgroundColor = .white
            
            secondSegmentButton.setTitleColor(.lightGray, for: .normal)
            secondSegmentView.backgroundColor = .clear
        default:
            sender.setTitleColor(.white, for: .normal)
            secondSegmentView.backgroundColor = .white
            
            firstSegmentButton.setTitleColor(.lightGray, for: .normal)
            firstSegmentView.backgroundColor = .clear
        }
    }
    
    private func createMenuBar() {
        // Creating additional view right under
        // the navigation bar
        let line = UIView()
        newView.backgroundColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
        view.addSubview(newView)
        view.addSubview(line)
        newView.translatesAutoresizingMaskIntoConstraints = false

        let guide = view.safeAreaLayoutGuide
        newView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        newView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        newView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        line.backgroundColor = .black
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        line.topAnchor.constraint(equalTo: newView.bottomAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        line.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        
        setSegmentView(newView)
    }
    
    private func setSegmentView(_ container: UIView) {
        
        firstSegmentButton.setSegmentButton(title: "All Recipes",
                                            textColor: .white,
                                            tag: 1)
        firstSegmentButton.addTarget(self, action: #selector(segmentButtonClicked(_:)), for: .touchUpInside)
        
        secondSegmentButton.setSegmentButton(title: "Top Rated",
                                                 textColor: .lightGray,
                                                 tag: 2)
        secondSegmentButton.addTarget(self, action: #selector(segmentButtonClicked(_:)), for: .touchUpInside)
        
        firstSegmentView.setSegmentView(color: .white)
        secondSegmentView.setSegmentView(color: .clear)
        
        let firstSegmentStackView = createSegmentStackView(button: firstSegmentButton,
                                                           segmentView: firstSegmentView)
        
        let secondSegmentStackView = createSegmentStackView(button: secondSegmentButton,
                                                            segmentView: secondSegmentView)
        
        
        let containerStackView = UIStackView(arrangedSubviews: [firstSegmentStackView, secondSegmentStackView])
        containerStackView.axis = .horizontal
        containerStackView.distribution = .fillEqually
        setStackViewContraints(stackView: containerStackView, superView: container)
    }
    
    private func createSegmentStackView(button: UIButton, segmentView: UIView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [button, segmentView])
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }
    
    private func setStackViewContraints(stackView: UIStackView, superView: UIView) {
        superView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

// MARK: - TableView
extension IngredientsRecipesViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 70
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        15
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if filteredRecipes.isEmpty {
            noCellsLabel.isHidden = false
        } else {
            noCellsLabel.isHidden = true
        }
        
        return filteredRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecipeCell
        
        let recipe = recipes[indexPath.section]
        
        cell.dishNameLabel.text = recipe.name
        cell.creatorLabel.text = recipe.author
        
        // background color when selected
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0.145, green: 0.212, blue: 0.125, alpha: 1)
        cell.selectedBackgroundView = selectedView
        selectedView.sizeToFit()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
