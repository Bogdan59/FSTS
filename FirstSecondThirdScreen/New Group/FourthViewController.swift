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

    var getQuote: PFObject?
    var getText = String()
    
    @IBOutlet weak var fourthTextView: UITextView!
    @IBOutlet weak var fourthLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fourthLabel.text! = getQuote as! String
        fourthTextView.text! = getText
//        fourthTextView.text! = getQuote as! String
        
    }


    
}
