//
//  FirstTableVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 09.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class FirstTableVC: UITableViewController {
    
    @IBOutlet weak var refresher: UIRefreshControl!
    var detailViewController: DetailViewController? = nil
    var category = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }
    
    func fetchData() {
        let query = PFQuery(className: "Categories")
        query.whereKeyExists("Class")
        query.findObjectsInBackground { (objects, error) in
            if let realObjects = objects {
                self.category = realObjects
                self.tableView.reloadData()
                self.refresher.endRefreshing()
            }
        }
    }
    
    @IBAction func updateResults(_ sender: UIRefreshControl) {
        fetchData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategoryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = category[indexPath.row] as? NSDate
                //                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                let controller = (segue.destination as! DetailViewController)
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let object = category[indexPath.row]
        cell.textLabel!.text = object["Class"] as? String
        return cell
    }
    //
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row tapped: \(indexPath.row)")
        
        let selectedCategory: PFObject = category[indexPath.row]
        let SecondTableVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondTableVCC") as! SecondTableVC
        SecondTableVC.selectedCategory = selectedCategory
        
        self.navigationController?.pushViewController(SecondTableVC, animated: true)
        
        
        
        
    }
    
    func loadCategory() {
        let categoryQuery = PFQuery(className: "Categories")
        categoryQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let foundCategory = result as? [PFUser] {
                self.category = foundCategory
                //                self.categoryTable.reloadData()
            }
            
        }
    }
    
    
}
