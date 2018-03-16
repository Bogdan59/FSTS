//
//  FourthTableVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 12.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//
import UIKit
import Parse

class FourthTableVC: UITableViewController {
    
    @IBOutlet weak var refresherQuotes: UIRefreshControl!
    //    @IBOutlet var categoryTable: UITableView!
    
    var selectedQuotes: PFObject?
    var quotesItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func updateCategoryResults(_ sender: UIRefreshControl) {
        fetchCategoryData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadQuotesCategorySub(selectedCategory: selectedQuotes)
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
        return quotesItems.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quotesCell = tableView.dequeueReusableCell(withIdentifier: "quoteDetailCell", for: indexPath)
        
        let bookItem = quotesItems[indexPath.row]
        let categoryUserTitle = bookItem.object(forKey: "Text") as? String
        
        quotesCell.textLabel?.text = categoryUserTitle
        
        return quotesCell
    }
    
    func loadQuotesCategorySub(selectedCategory: PFObject!) {
        let quotesQuery = PFQuery(className: "TotalTest")
        quotesQuery.whereKey("Subcategory", equalTo: selectedCategory ?? nil)
        quotesQuery.includeKey("Subcategory")
        quotesQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
                //                print("Found Category: \(searchResults.count)")
                self.quotesItems = searchResults
                //                self.categoryTable.reloadData()
            }
        }
    }
    
    func fetchCategoryData() {
        let categoriesQuery = PFQuery(className: "TotalTest")
        //        categoriesQuery.whereKeyExists("Subcategory")
        categoriesQuery.whereKey("Subcategory", equalTo: selectedQuotes ?? nil)
        categoriesQuery.findObjectsInBackground { (objects, error) in
            if let realCategoryObjects = objects {
                self.quotesItems = realCategoryObjects
                self.tableView.reloadData()
                self.refresherQuotes.endRefreshing()
            }
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategoryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let Categoryobject = quotesItems[indexPath.row] as? NSDate
                let categoryController = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                categoryController.detailItem = Categoryobject
                categoryController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                categoryController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    func loadCategory() {
        let categoryQuery = PFQuery(className: "TotalTest")
        categoryQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let foundQuote = result as? [PFUser] {
                self.quotesItems = foundQuote
                //                self.categoryTable.reloadData()
            }
        }
    }
    
}

