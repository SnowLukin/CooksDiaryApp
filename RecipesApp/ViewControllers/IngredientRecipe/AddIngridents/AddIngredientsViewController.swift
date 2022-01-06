//
//  AddIngredientsViewController.swift
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

class AddIngredientsViewController: UITableViewController {

    fileprivate let cellIdentifier = "ingredientCell"
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup models
        sections = [
            Section(title: "Section 1", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 2", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 3", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 4", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
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
        if indexPath.row == 0 {
            var content = cell.defaultContentConfiguration()
            content.text = sections[indexPath.section].title
            cell.contentConfiguration = content
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
        tableView.reloadSections([indexPath.section], with: .none)
    }
}
