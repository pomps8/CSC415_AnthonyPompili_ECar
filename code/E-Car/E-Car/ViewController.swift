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
    
    var db: SQLDatabase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        db = SQLDatabase()
        //db?.listCar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        //takes us back to login screen
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

}

