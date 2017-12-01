// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: MainMenuController.swift
// Description: This File is the MainMenuController to set up the navigation controller which sets up the "back button" that is seen on top of the screen
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import Foundation
import UIKit

class MainMenuController : UINavigationController {
    /*
    @objc func backToInitial(sender: AnyObject) {
        
        self.navigationController?.popToRootViewController(animated: false)
        
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Backk", style: .done, target: self, action: #selector(self.backToInitial(sender:)))
    }
    
}
