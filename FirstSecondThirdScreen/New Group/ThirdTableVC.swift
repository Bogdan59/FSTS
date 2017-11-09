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
    
    @IBOutlet var quoteTable: UITableView!
    
    var selectedQuote: PFObject?
    var quoteItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
