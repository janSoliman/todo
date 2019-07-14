//
//  ViewController.swift
//  todo
//
//  Created by Jan Soliman on 13.07.19.
//  Copyright © 2019 Jan Soliman. All rights reserved.
//

import UIKit

class toDoViewController: UITableViewController {

    let ItemArray = [ "Help Jan", "Help Rina", "Help Freddy", "go to work" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
}

