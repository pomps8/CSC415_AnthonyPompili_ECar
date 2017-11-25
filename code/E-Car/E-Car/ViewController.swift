//
//  ViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
// Loaded when "More" is selected from the initial view controller

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

