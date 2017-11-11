//
//  LoginViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
// This file deals with any type of login functionality with account
import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    //main funcation for this viewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //validateAccount takes username and password passed in through the login screen
    //and checks with database. If the account exists, true is returned, else, false.
    func validateAccount (username: String, password: String) -> Bool{
        print("Validating credentials passed...")
        //check account info
        
        return false
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let mainMenuController = storyboard?.instantiateViewController(withIdentifier: "MainMenuController") as! MainMenuController
        
        present(mainMenuController, animated: true, completion: nil)
    }
}
