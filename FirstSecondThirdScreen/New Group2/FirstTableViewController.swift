//
//  ViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class FirstTableViewController: UITableViewController {
    
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
    
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = category[indexPath.row] as? NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Table View
    
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
        let secondTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondTable") as! SecondTableViewController
        secondTableViewController.selected12Category = selectedCategory
        
        self.navigationController?.pushViewController(secondTableViewController, animated: true)
        
        
        
        
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

//class FirstTableViewController: UITableViewController {
//
//    var FirstTableArray = [String]()
//    var SecondArray = [SecondTable]()
//    var ThirdArray = [ThirdTable]()
//
////    var  FirstTableArray = [
////        Person(
////            id: 1,
////            picture: "picture1.png",
////            firstName: "John",
////            lastName: "Smith"
////        ),
////        Person(
////            id: 2,
////            picture: "picture2.png",
////            firstName: "Mike",
////            lastName: "Rutherford"
////        ),
////        ]
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        FirstTableArray = ["Из книг", "Из песен", "Из мультфильмов"]
//
//        SecondArray = [SecondTable(SecondTitle: ["I Eat Tomatoes. Дорогой звёзд", "Ilze Falb. Издевательство над Эвтерпой", "Nekolife. Песнь о мечте"], Pic: ""),
//                       SecondTable(SecondTitle: ["10 причин моей ненависти (10 Things I Hate About You", "11.22.63", "12 обезьян (12 Monkeys)"], Pic: ""),
//                       SecondTable(SecondTitle: ["FirstThird", "SecondThird", "Thirdthird"], Pic: ""),
//                        SecondTable(SecondTitle: ["First4"], Pic: "")]
//
//                    ThirdArray = [ThirdTable(ThirdTitle: ["3.1", "3.1", ".3.1"]),
//                       ThirdTable(ThirdTitle: ["3.2", "3.2", ".3.2"]),
//                       ThirdTable(ThirdTitle: ["3.3", "3.3", "3.3"]),
//                       ThirdTable(ThirdTitle: ["3.4"])]
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FirstTableArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var Cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
//
//        Cell.textLabel?.text = FirstTableArray[indexPath.row]
//
//        return Cell
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
//        var DestViewController = segue.destination as! SecondTableViewController
//        var SecondTableArrayTwo: SecondTable
//        SecondTableArrayTwo = SecondArray[indexPath.row]
//        DestViewController.SecondArray = SecondTableArrayTwo.SecondTitle
//    }
//
//
//
//}




