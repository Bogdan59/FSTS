//
//  ReadServerTableViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 08.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

//import UIKit
//import Parse
//
//class ReadServerTableViewController : UITableViewController {
//
//
//    @IBOutlet weak var refresher: UIRefreshControl!
//    var detailViewController: ServerWriteViewController? = nil
//    var objects = [PFObject]()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        fetchData()
//    }
//
//    func fetchData() {
//        let query = PFQuery(className: "Categories")
//        query.whereKeyExists("Class")
//        query.findObjectsInBackground { (objects, error) in
//            if let realObjects = objects {
//                self.objects = realObjects
//                self.tableView.reloadData()
//                self.refresher.endRefreshing()
//            }
//        }
//    }
//
//    @IBAction func updateResults(_ sender: UIRefreshControl) {
//        fetchData()

//
//
//    // MARK: - Segues
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
//
//    // MARK: - Table View
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objects.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let object = objects[indexPath.row]
//        cell.textLabel!.text = object["Class"] as? String
//        return cell
//    }
//
//
//}



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



