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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBAction func saveRecord() {
        let object = PFObject(className: "UsersQuotes")
        object["textQuote"] = textField.text!
        object["username"] = self.usernameField.text!
        object.saveEventually {
            (success, error) in
            if success {
                self.textField.text = nil
                self.usernameField.text = nil
            }
            
        }
        
    }
    
    
    //    let object = PFObject(className: "Quote")
    //    object["text"] = textField.text!
    //    object["authorName"] = "Dima"
    //    object.saveEventually { (success, error) in
    //    if success {
    //    self.textField.text = nil
    //    }
    //    }
    
    
}


