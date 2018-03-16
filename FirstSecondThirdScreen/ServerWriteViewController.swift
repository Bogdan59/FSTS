//
//  ServerWriteViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 08.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class ServerWriteViewController : UIViewController {
    
    @IBOutlet weak var quoteTextFieldStatic: UITextView!
    
    @IBAction func organizeBtn(_ sender: UIBarButtonItem) {
        if isSlideMenuHidden {
            sideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
            
        }else {
            sideMenuConstraint.constant = -140
            
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        isSlideMenuHidden = !isSlideMenuHidden
    }
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var isSlideMenuHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize constant with 0
        //        quoteTextFieldStatic.delegate = self as! UITextViewDelegate
        
        sideMenuConstraint.constant = -140
    }
    
}


