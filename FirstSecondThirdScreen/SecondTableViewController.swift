//
//  secondTableViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import Foundation
import Parse

class SecondTableViewController: UITableViewController {
    
    
    @IBOutlet var categoryTable: UITableView!
    var selected12Category: PFObject?
    var category12Items = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadCategorySub(selectedCategory: selected12Category)
        //        loadCategorySongs(selectedCategory: selectedCategory)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return category12Items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let bookItem = category12Items[indexPath.row]
        let categoryUserTitle = bookItem.object(forKey: "Text") as? String
        //
        //        let songItem = categoryItems[indexPath.row]
        //        _ = songItem.object(forKey: "SongsText") as? String
        
        bookCell.textLabel?.text = categoryUserTitle
        
        return bookCell
    }
    
    func loadCategorySub(selectedCategory: PFObject!) {
        
        let bookQuery = PFQuery(className: "TotalTest")
        bookQuery.whereKey("Subcategory", equalTo: selectedCategory)
        bookQuery.includeKey("Subcategory")
        
        bookQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
                //                print("Found Category: \(searchResults.count)")
                
                self.category12Items = searchResults
                self.categoryTable.reloadData()
            }
        }
    }
    
}
