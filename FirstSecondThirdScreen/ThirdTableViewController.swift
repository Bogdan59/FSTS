//
//  ThirdVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import Foundation
import UIKit

class ThirdTableViewController: UITableViewController {
    
    var ThirdArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThirdArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var CellThird = self.tableView.dequeueReusableCell(withIdentifier: "ThirdCell", for: indexPath) as UITableViewCell
        
        CellThird.textLabel?.text = ThirdArray[indexPath.row]
        
        return CellThird
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController = segue.destination as! ThirdTableViewController
    }
    
}
