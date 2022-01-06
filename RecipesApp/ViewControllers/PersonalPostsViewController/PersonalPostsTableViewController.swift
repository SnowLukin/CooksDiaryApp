//
//  PersonalPostsTableViewController.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 06.01.2022.
//

import UIKit

class PersonalPostsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldRecipeCell", for: indexPath) as! TextFieldRecipeTableViewCell
            cell.textFieldRecipe.tag = indexPath.section
            return cell
        case 1:
           let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldRecipeCell", for: indexPath) as! TextFieldRecipeTableViewCell
            cell.textFieldRecipe.tag = indexPath.section
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tagsRecipeCell", for: indexPath) as! TagsRecipeTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageRecipeCell", for: indexPath) as! ImageRecipeTableViewCell
            
            cell.recipeImage.image = UIImage(named: "Snow")
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonRecipeCell", for: indexPath) as! ButtonRecipeTableViewCell
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 70
        case 1: return 150
        case 2: return 50
        case 3: return 170
        default: return 70
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        
        var content = header.defaultContentConfiguration()
        content.textProperties.color = .white
        content.textProperties.font = .boldSystemFont(ofSize: 12)
        
        switch section {
        case 0:
            content.text = "Dish name:"
        case 1:
            content.text = "Cooking method:"
        case 2:
            content.text = "Main ingredients:"
        case 3:
            content.text = "Photo:"
        default:
            content.text = ""
        }
        
        header.contentConfiguration = content
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}


