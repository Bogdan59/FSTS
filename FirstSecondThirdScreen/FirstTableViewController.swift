//
//  ViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var FirstTableArray = [String]()
    var SecondArray = [SecondTable]()
    var ThirdArray = [ThirdTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirstTableArray = ["Из книг", "Из сериало", "Из песен", "Из мультфильмов"]
        
        SecondArray = [SecondTable(SecondTitle: ["I Eat Tomatoes. Дорогой звёзд", "Ilze Falb. Издевательство над Эвтерпой", "Nekolife. Песнь о мечте"], Pic: ""),
                       SecondTable(SecondTitle: ["""
                        10 причин моей ненависти (10 Things I Hate About You
""", "11.22.63", "12 обезьян (12 Monkeys)"], Pic: ""),
                       SecondTable(SecondTitle: ["FirstThird", "SecondThird", "Thirdthird"], Pic: ""),
                        SecondTable(SecondTitle: ["First4"], Pic: "")]
        
                    ThirdArray = [ThirdTable(ThirdTitle: ["3.1", "3.1", ".3.1"]),
                       ThirdTable(ThirdTitle: ["3.2", "3.2", ".3.2"]),
                       ThirdTable(ThirdTitle: ["3.3", "3.3", "3.3"]),
                       ThirdTable(ThirdTitle: ["3.4"])]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstTableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = FirstTableArray[indexPath.row]
        
        return Cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        var DestViewController = segue.destination as! SecondTableViewController
        var SecondTableArrayTwo: SecondTable
        SecondTableArrayTwo = SecondArray[indexPath.row]
        DestViewController.SecondArray = SecondTableArrayTwo.SecondTitle
    }
    
    
    
}

