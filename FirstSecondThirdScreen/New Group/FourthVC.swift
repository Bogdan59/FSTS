//
//  FourthVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 11.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class FourthVC: UIViewController {

    
    @IBOutlet weak var quoteTextDetail: UITableView!


    var textQuote: PFObject?
    var quoteDetailText = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        loadQuoteTexts(selectedQuote: textQuote)
//    }
    
    

    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//
//
//        return 1
//    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//
//
//        return quoteDetailText.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let quoteCell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
//
//        let quoteItem = quoteDetailText[indexPath.row]
//        let quoteUserTitle = quoteItem.object(forKey: "TextQuote") as? String
//        //
//        //        let songItem = categoryItems[indexPath.row]
//        //        _ = songItem.object(forKey: "SongsText") as? String
//
//        quoteCell.textLabel?.text = quoteUserTitle
//
//        return quoteCell
//    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showQuoteDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let quoteobject = quoteItems[indexPath.row] as? NSDate
//                let quoteController = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                quoteController.detailItem = quoteobject
//                quoteController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                quoteController.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Row tapped: \(indexPath.row)")
//
//        let selectedQuote: PFObject = quoteDetailText[indexPath.row]
//        let FourthVC = self.storyboard?.instantiateViewController(withIdentifier: "FourthVCC") as! FourthVC
//        FourthVC.textQuote = selectedQuote
//
//        self.navigationController?.pushViewController(FourthVC, animated: true)
//
//
//
//
//    }
    
//    func loadQuoteTexts(selectedQuote: PFObject!) {
//
//        let quoteQuery = PFQuery(className: "TotalQuote")
//        quoteQuery.whereKey("QuoteSubs", equalTo: selectedQuote ?? nil)
//        quoteQuery.includeKey("QuoteSubs")
//
//        quoteQuery.findObjectsInBackground { (result: [PFObject]?, error) in
//            if let searchQuoteResults = result {
//                //                print("Found Category: \(searchResults.count)")
//
//                self.quoteDetailText = searchQuoteResults
//                self.quoteTable.reloadData()
//            }
//        }
//        //
//        //
//
//
//    }
}
