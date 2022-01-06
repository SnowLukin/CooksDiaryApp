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
            return cell
        case 1:
           let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldRecipeCell", for: indexPath) as! TextFieldRecipeTableViewCell
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
