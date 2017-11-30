// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: LoginViewController.swift
// Description: This File is the LoginViewController for the "login" to the main menu
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

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
