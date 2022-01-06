//
//  SettingsTableViewController.swift
//  RecipesApp
//
//  Created by Anastasia Izmaylova on 05.01.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    private let user = User(username: "User", name: "Snow", surname: "Lukin", bio: "Personable line cook with 4+ years expertise in a fast-paced kitchen environment. Achieved region-best culinary satisfaction rating according to national food critic (5-Star Rating). Seeking to advance my culinary career by joining the Bahari Restaurant team as the new chef.", sex: .male)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        tableView.backgroundColor = UIColor(red: 0.224, green: 0.381, blue: 0.210, alpha: 1)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
            cell.userNameLabel.text = "\(user.name) \(user.surname)"
            cell.userImageView.image = UIImage(named: "Snow")
            return cell
            
        case 1: let cell = tableView.dequeueReusableCell(withIdentifier: "bioCell", for: indexPath) as! BioTableViewCell
            cell.bioLabel.text = user.bio
            return cell
            
        default: let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonTableViewCell
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
            return 30
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        var content = header.defaultContentConfiguration()
        content.textProperties.color = .white
        
        if section == 1 {
            content.text = "Bio"
        } else {
            content.text = ""
        }
        
        header.contentConfiguration = content
        
        return header
        
    }
}