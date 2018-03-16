//
//  DetailViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 08.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class ReadServerTableViewController : UITableViewController { //, UITableViewDataSource, UITableViewDelegate
    
    @IBOutlet var userQuoteTable: UITableView!
    
    var userQuote = [PFUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserQuote()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userQuote.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ReadCell", for: indexPath)
        let categoryObject: PFUser = userQuote[indexPath.row]
        cell.textLabel!.text = categoryObject.object(forKey: "text") as? String
        cell.textLabel!.text = categoryObject.object(forKey: "authorName") as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row tapped: \(indexPath.row)")
        
    }
    
    func loadUserQuote() {
        let categoryQuery = PFQuery(className: "AddsUserQuote")
        categoryQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let foundCategory = result as? [PFUser] {
                self.userQuote = foundCategory
                self.userQuoteTable.reloadData()
            }
            
        }
    }
    
}



