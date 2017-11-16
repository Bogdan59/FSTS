//
//  UsersQuotesTVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 16.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class UsersQuotesTVC: UITableViewController {

@IBOutlet weak var refresherUQ: UIRefreshControl!
var detailViewController: DetailViewController? = nil
var userQuotes = [PFObject]()


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    fetchDataQuotes()
}

func fetchDataQuotes() {
    let quoteQuery = PFQuery(className: "AddsUserQuote")
    quoteQuery.whereKeyExists("authorName")
    quoteQuery.findObjectsInBackground { (objects, error) in
        if let realQuoteObjects = objects {
            self.userQuotes = realQuoteObjects
            self.tableView.reloadData()
            self.refresherUQ.endRefreshing()
        }
    }
}

@IBAction func updateUQResults(_ sender: UIRefreshControl) {
    fetchDataQuotes()
}


// MARK: - Segues

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let object = userQuotes[indexPath.row] as! NSDate
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.detailItem = object
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
}

// MARK: - Table View

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userQuotes.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ReadCell", for: indexPath)
    
    let object = userQuotes[indexPath.row]
    cell.textLabel!.text = object["text"] as? String
    return cell
}


}
