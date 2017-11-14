//
//  LoginRegistrationVC.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 13.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class LoginRegistrationVC: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginBtn(_ sender: AnyObject) {
        // Retrieving the info from the text fields
        let username = usernameText.text
        let password = passwordText.text
        
        // Defining the user object
        PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
            }
            else {
                self.alert(message: "Welcome back!", title: "Login")
                self.usernameText.text = nil
                self.passwordText.text = nil
            }
        })
    }
    
    @IBAction func registrationBtn(_ sender: AnyObject) {
        // Retrieving the info from the text fields
        let username = usernameText.text
        let password = passwordText.text
        
        // Defining the user object
        let user = PFUser()
        user.username = username
        user.password = password
        
        // We won't set the email for this example;
        // Just for simplicity
        
        // Signing up using the Parse API
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
                
            } else {
                self.alert(message: "Registered successfully", title: "Registering")
                self.usernameText.text = nil
                self.passwordText.text = nil
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
