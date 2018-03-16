//
//  ThirdTableViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 09.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse


class ThirdTableVC: UITableViewController {
    
    
    @IBOutlet weak var refresherQuotes: UIRefreshControl!
    @IBOutlet var quoteTable: UITableView!
    
    var detailFourthVC: FourthViewController? = nil
    var selectedQuote: PFObject?
    var quoteItems = [PFObject]()
    
    override func viewDidLoad() {
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailFourthVC = (controllers[controllers.count-1] as! UINavigationController).topViewController as? FourthViewController
        }
        super.viewDidLoad()
        fetchQuotesData()
    }
    
    func fetchQuotesData() {
        let quotesQuery = PFQuery(className: "TotalTest")
        quotesQuery.whereKeyExists("Subcategory")
        //        quotesQuery.whereKey("Subcategory", equalTo: selectedQuote ?? nil)
        quotesQuery.findObjectsInBackground { (objects, error) in
            if let realCategoryObjects = objects {
                self.quoteItems = realCategoryObjects
                self.tableView.reloadData()
                self.refresherQuotes.endRefreshing()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadQuoteTexts(selectedQuote: selectedQuote)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showQuoteTexts" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = quoteItems[indexPath.row] as! PFObject
                let controller = (segue.destination) as! FourthViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteItems.count
    }
    
    
    
    @IBAction func updateQuotesResults(_ sender: UIRefreshControl) {
        fetchQuotesData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quoteCell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        let object = quoteItems[indexPath.row] as! PFObject
        quoteCell.textLabel!.text = object["TextQuote"] as? String  //object.description
        return quoteCell
    }
    
    func loadQuoteTexts(selectedQuote: PFObject!) {
        let quoteQuery = PFQuery(className: "TotalQuote")
        quoteQuery.whereKey("QuoteSubs", equalTo: selectedQuote ?? nil)
        quoteQuery.includeKey("QuoteSubs")
        quoteQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchQuoteResults = result {
                //                print("Found Category: \(searchResults.count)")
                self.quoteItems = searchQuoteResults
                self.quoteTable.reloadData()
            }
        }
    }
    
}
