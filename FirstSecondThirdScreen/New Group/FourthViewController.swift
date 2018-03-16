//
//  FourthViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 16.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class FourthViewController: UIViewController {

//    var getQuote: PFObject?
//    var getText = String()
//    var getingText = ThirdTableVC.loadQuoteTexts
    

    @IBOutlet weak var fourthLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = fourthLabel {
                label.text = detail["TextQuote"] as? String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: PFObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }

}
