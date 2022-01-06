//
//  RecipeInfoViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 04.01.2022.
//

import UIKit

class RecipeInfoViewController: UIViewController {
    
    
    // MARK: Properties
    var recipe: Recipe!
    
    private let headerHeight: CGFloat = 230
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 0.063, green: 0.436, blue: 0.298, alpha: 1)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        if let image = UIImage(named: "VegetableStirFryImage") {
            imageView.image = image
        }
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // view for rounded corners under image
    private let roundedCornersView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.063, green: 0.436, blue: 0.298, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()
    
    private let lineUnderRecipeNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let recipeDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private let endLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var headerTopConstraint: NSLayoutConstraint!
    private var headerHeightConstraint: NSLayoutConstraint!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeNameLabel.text = recipe.name
        recipeDescriptionLabel.text = recipe.description
        scrollView.delegate = self
        addSubviews()
        arrangeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavBackground(.clear)
    }
    
    private func addSubviews() {
        headerContainerView.addSubview(headerImageView)
        scrollView.addSubview(headerContainerView)
        scrollView.addSubview(roundedCornersView)
        scrollView.addSubview(recipeNameLabel)
        scrollView.addSubview(lineUnderRecipeNameView)
        scrollView.addSubview(recipeDescriptionLabel)
        scrollView.addSubview(endLineView)
        view.addSubview(scrollView)
    }
}

// MARK: - Navigation Bar SetUp
extension RecipeInfoViewController {
    private func setNavBackground(_ color: UIColor) {
        let navBar = navigationController!.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.backgroundColor = color
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

// MARK: - Set Contraints
extension RecipeInfoViewController {
    private func arrangeConstraints() {
        let scrollViewConstraints: [NSLayoutConstraint] = [
            scrollView.topAnchor
                .constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor
                .constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        headerTopConstraint = headerContainerView.topAnchor
            .constraint(equalTo: view.topAnchor)
        headerHeightConstraint = headerContainerView.heightAnchor
            .constraint(equalToConstant: 230)
        let headerContainerViewConstraints: [NSLayoutConstraint] = [
            headerTopConstraint,
            headerContainerView.widthAnchor
                .constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0),
            headerHeightConstraint
        ]
        NSLayoutConstraint.activate(headerContainerViewConstraints)
        
        let headerImageViewConstraints: [NSLayoutConstraint] = [
            headerImageView.topAnchor
                .constraint(equalTo: headerContainerView.topAnchor),
            headerImageView.leadingAnchor
                .constraint(equalTo: headerContainerView.leadingAnchor),
            headerImageView.trailingAnchor
                .constraint(equalTo: headerContainerView.trailingAnchor),
            headerImageView.bottomAnchor
                .constraint(equalTo: headerContainerView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(headerImageViewConstraints)
        
        let roundedCornersViewContraints: [NSLayoutConstraint] = [
            roundedCornersView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 185),
            roundedCornersView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0),
            roundedCornersView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(roundedCornersViewContraints)
        
        let recipeNameLabelContraints: [NSLayoutConstraint] = [
            recipeNameLabel.topAnchor.constraint(equalTo: roundedCornersView.topAnchor, constant: 20),
            recipeNameLabel.leadingAnchor.constraint(equalTo: roundedCornersView.leadingAnchor, constant: 40),
            recipeNameLabel.trailingAnchor.constraint(equalTo: roundedCornersView.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(recipeNameLabelContraints)
        
        let lineUnderRecipeNameViewContraints: [NSLayoutConstraint] = [
            lineUnderRecipeNameView.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 7),
            lineUnderRecipeNameView.heightAnchor.constraint(equalToConstant: 3),
            lineUnderRecipeNameView.leadingAnchor.constraint(equalTo: roundedCornersView.leadingAnchor, constant: 20),
            lineUnderRecipeNameView.trailingAnchor.constraint(equalTo: roundedCornersView.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(lineUnderRecipeNameViewContraints)
        
        let recipeDescriptionLabelConstraints: [NSLayoutConstraint] = [
            recipeDescriptionLabel.topAnchor.constraint(equalTo: lineUnderRecipeNameView.bottomAnchor, constant: 15),
            recipeDescriptionLabel.leadingAnchor.constraint(equalTo: roundedCornersView.leadingAnchor, constant: 30),
            recipeDescriptionLabel.trailingAnchor.constraint(equalTo: roundedCornersView.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(recipeDescriptionLabelConstraints)
        
        let endViewContaints: [NSLayoutConstraint] = [
            endLineView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            endLineView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            endLineView.topAnchor.constraint(equalTo: recipeDescriptionLabel.bottomAnchor, constant: 50),
            endLineView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(endViewContaints)
    }
}

// MARK: - ScrollViewDelegate
extension RecipeInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0.0 {
            // Scrolling down: Scale
            headerHeightConstraint?.constant =
                headerHeight - scrollView.contentOffset.y
        } else {
            // Scrolling up: Parallax
            let parallaxFactor: CGFloat = 0.25
            let offsetY = scrollView.contentOffset.y * parallaxFactor
            let minOffsetY: CGFloat = 8.0
            let availableOffset = min(offsetY, minOffsetY)
            let contentRectOffsetY = availableOffset / headerHeight
            headerTopConstraint?.constant = view.frame.origin.y
            headerHeightConstraint?.constant =
                headerHeight - scrollView.contentOffset.y
            headerImageView.layer.contentsRect =
                CGRect(x: 0, y: -contentRectOffsetY, width: 1, height: 1)
        }
        
    }
}
