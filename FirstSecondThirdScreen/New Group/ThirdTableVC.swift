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
    
        var selectedQuote: PFObject?
         var quoteItems = [PFObject]()
    
             override func viewDidLoad() {
                     super.viewDidLoad()
                
                 }
    @IBAction func updateQuotesResults(_ sender: UIRefreshControl) {
        fetchQuotesData()
    }
    
         override func viewWillAppear(_ animated: Bool) {
                 super.viewWillAppear(animated)
            
                     loadQuoteTexts(selectedQuote: selectedQuote)
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
         
            
            
                 return quoteItems.count
             }
    
    func fetchQuotesData() {
        let quotesQuery = PFQuery(className: "TotalTest")
        //        categoriesQuery.whereKeyExists("Subcategory")
        quotesQuery.whereKey("Subcategory", equalTo: selectedQuote ?? nil)
        quotesQuery.findObjectsInBackground { (objects, error) in
            if let realCategoryObjects = objects {
                self.quoteItems = realCategoryObjects
                self.tableView.reloadData()
                self.refresherQuotes.endRefreshing()
            }
        }
    }
    
    
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let quoteCell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
         
                 let quoteItem = quoteItems[indexPath.row]
                 let quoteUserTitle = quoteItem.object(forKey: "TextQuote") as? String
                 //
                 //        let songItem = categoryItems[indexPath.row]
                 //        _ = songItem.object(forKey: "SongsText") as? String
         
                 quoteCell.textLabel?.text = quoteUserTitle
         
                 return quoteCell
             }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuoteDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let quoteobject = quoteItems[indexPath.row] as? NSDate
                let quoteController = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                quoteController.detailItem = quoteobject
                quoteController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                quoteController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row tapped: \(indexPath.row)")
        
        let selectedQuotes: PFObject = quoteItems[indexPath.row]
        let  FourthTableVC = self.storyboard?.instantiateViewController(withIdentifier: "FourthTableVCC") as! FourthTableVC
        FourthTableVC.selectedQuotes = selectedQuotes
        
        self.navigationController?.pushViewController(FourthTableVC, animated: true)
        
        
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
                 //
                 //
         
         
             }
     }
