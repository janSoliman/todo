//
//  ViewController.swift
//  todo
//
//  Created by Jan Soliman on 13.07.19.
//  Copyright © 2019 Jan Soliman. All rights reserved.
//

import UIKit

class toDoViewController: UITableViewController {

    var ItemArray = [ "Help Jan", "Help Rina", "Help Freddy", "go to work" ]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK - Table
        ItemArray = defaults.array(forKey: "toDoListArray") as! [String]
        if let items = defaults.array(forKey: "toDoListArray") as? [String] {
            ItemArray = items
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
        
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = ItemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(ItemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        print("sucess")
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
       self.ItemArray.append(textField.text!)
            self.defaults.set(self.ItemArray, forKey: "toDoListArray")
            self.tableView.reloadData()
        }
        
            alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
    }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

