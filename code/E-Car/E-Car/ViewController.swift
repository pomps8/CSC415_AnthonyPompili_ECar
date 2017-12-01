// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: ViewController.swift
// Description: This File is the viewController for the main menu of E-Car. The database, if it is not set up already, is set up upon entering this screen.
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import UIKit
import SQLite

class ViewController: UIViewController {
    
    //Global Variables
    var db: SQLDatabase? //Reference to database to load into application, only creates database if a table with the specfied name doesn't exit
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: viewDidLoad()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Application must load into this view for view to load
    //
    //    Post-condition: View controller is loaded, displays view to user's screen
    //-----------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        db = SQLDatabase() //initialize the database, making sure the table exists.
        //If it doesn't, its created now
        
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: didReceiveMemoryWarning()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Memory low in device
    //
    //    Post-condition: Delete resources here (none deleted)
    //-----------------------------------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: logoutButtonPressed()
    //
    //    Parameters: sender: UIButtonItem; Button tapped on main menu to "log out" user
    //                          basically bringing the back to the first screen
    //
    //
    //    Pre-condition: ViewController must be loaded
    //
    //    Post-condition: User is brought back to initial screen
    //-----------------------------------------------------------------------------------------
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}

