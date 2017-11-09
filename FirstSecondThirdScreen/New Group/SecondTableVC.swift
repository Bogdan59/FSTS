//
//  SecondTableVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 09.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class SecondTableVC: UITableViewController {
    
    @IBOutlet weak var refresherCategory: UIRefreshControl!
    @IBOutlet var categoryTable: UITableView!
    
    var selectedCategory: PFObject?
    var categoryItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateCategoryResults(_ sender: UIRefreshControl) {
        fetchCategoryData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadCategorySub(selectedCategory: selectedCategory)
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
        return categoryItems.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let bookItem = categoryItems[indexPath.row]
        let categoryUserTitle = bookItem.object(forKey: "Text") as? String
        //
        //        let songItem = categoryItems[indexPath.row]
        //        _ = songItem.object(forKey: "SongsText") as? String
        
        bookCell.textLabel?.text = categoryUserTitle
        
        //        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        //        let object = category[indexPath.row]
        //        categoryTable.textLabel!.text = bookItem["Text"] as? String
        
        return bookCell
    }
    
    
    
    
    func loadCategorySub(selectedCategory: PFObject!) {
        
        let bookQuery = PFQuery(className: "TotalTest")
        bookQuery.whereKey("Subcategory", equalTo: selectedCategory ?? nil)
        bookQuery.includeKey("Subcategory")
        
        bookQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
                //                print("Found Category: \(searchResults.count)")
                
                self.categoryItems = searchResults
                self.categoryTable.reloadData()
            }
        }
        //
        //
        
        
    }
    
    func fetchCategoryData() {
        let categoriesQuery = PFQuery(className: "TotalTest")
        //        categoriesQuery.whereKeyExists("Subcategory")
        categoriesQuery.whereKey("Subcategory", equalTo: selectedCategory ?? nil)
        categoriesQuery.findObjectsInBackground { (objects, error) in
            if let realCategoryObjects = objects {
                self.categoryItems = realCategoryObjects
                self.tableView.reloadData()
                self.refresherCategory.endRefreshing()
            }
        }
    }
    
    
    
    // MARK: - Segues
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "showCategoryDetail" {
    //            if let indexPath = tableView.indexPathForSelectedRow {
    //                let Categoryobject = categoryItems[indexPath.row] as? NSDate
    //                let categoryController = (segue.destination as! UINavigationController).topViewController as! DetailViewController
    //                categoryController.detailItem = Categoryobject
    //                categoryController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
    //                categoryController.navigationItem.leftItemsSupplementBackButton = true
    //            }
    //        }
    //    }
    
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    //
    //        let object = category[indexPath.row]
    //        cell.textLabel!.text = object["Class"] as? String
    //        return cell
    //    }
    //
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row tapped: \(indexPath.row)")
        
        let selectedQuote: PFObject = categoryItems[indexPath.row]
        let ThirdTableVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdTableVCC") as! ThirdTableVC
        ThirdTableVC.selectedQuote = selectedQuote
        
        self.navigationController?.pushViewController(ThirdTableVC, animated: true)
        
        
        
        
    }
    
    func loadCategory() {
        let categoryQuery = PFQuery(className: "TotalTest")
        categoryQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let foundQuote = result as? [PFUser] {
                self.categoryItems = foundQuote
                //                self.categoryTable.reloadData()
            }
            
        }
    }
    
    
}
