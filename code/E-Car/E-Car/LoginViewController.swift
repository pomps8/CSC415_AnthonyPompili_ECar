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
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: viewDidLoad()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Application must load into this view for view to load, displays view with
    //                  the "more info" button on the bottom
    //
    //    Post-condition: View controller is loaded, displays view to user's screen
    //-----------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: loginButtonPressed()
    //
    //    Parameters: sender: UIButton; Button tapped on main menu to "log in" user
    //                          basically bringing them into the main menu
    //
    //
    //    Pre-condition: ViewController must be loaded initally
    //
    //    Post-condition: User is brought back to initial screen
    //-----------------------------------------------------------------------------------------
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let mainMenuController = storyboard?.instantiateViewController(withIdentifier: "MainMenuController") as! MainMenuController
        present(mainMenuController, animated: true, completion: nil) //present the MainMenuController once the button is selected
    }
}

