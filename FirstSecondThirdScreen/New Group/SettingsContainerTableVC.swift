//
//  SettingsContainerTableVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 13.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class SettingsContainerTableVC: UITableViewController {
    
    var containerArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerArray = ["О программе", "Помощь", " ", "Оценить приложение"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return containerArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "containerCell", for: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = containerArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
}
