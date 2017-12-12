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
    var myCar: Car?
    
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
    
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: shouldPerformSegue()
    //
    //    Parameters: pickerView: withIdentifier: identifier: String //Show segue for going to next view
    //                              Sender: Any?                     //sender of call
    //
    //
    //    Pre-condition: Must attempt to perform segue to see if we can perform this
    //
    //    Post-condition: If true, go to next view, else, stay here and display UIAlert with error
    //-----------------------------------------------------------------------------------------
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        //Segue to go to ViewCarViewController is called "showCar", so we know which screen were trying to go to here
        if identifier == "showPersonalCar" {
            // query to get car from database
            myCar = db?.getPersonalCar()

            if myCar == nil {
                print("No car found")
                
                //Display allert if no car is found with this data passed in the query
                let alert = UIAlertController(title: "No Personal Car Set", message: "Please set personal car", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
                //value is bad, don't go to next screen
                return false
            }
        }
        //Value is good, can go to next screen
        
        return true
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: prepare()
    //
    //    Parameters: for segue: UIStoryboardSegue //Segue to perform, how to get to next screen
    //                  sender: Any?               //Sender of all
    //
    //
    //    Pre-condition: Must attempt to perform segue to see if we can perform this
    //
    //    Post-condition: If true, go to next view, else, stay here and display UIAlert with error
    //-----------------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if the destination is the ViewCarViewController, then send the data from the query
        if let viewCarViewController = segue.destination as? ViewCarViewController {
            viewCarViewController.yearToDisplay = myCar!.getYear()
            viewCarViewController.brandToDisplay = myCar!.getBrand()
            viewCarViewController.modelToDisplay = myCar!.getName()
            viewCarViewController.transmissionToDisplay = myCar!.getTransmission()
            viewCarViewController.cylinderToDisplay = myCar!.getCylinder()
            viewCarViewController.mpgCityToDisplay = myCar!.getMpgCity()
            viewCarViewController.mpgHighwayToDisplay = myCar!.getMpgHighway()
            viewCarViewController.mpgAverageToDisplay = myCar!.getMpgAvg()
            viewCarViewController.co2 = myCar!.getCo2()
        }
    }
}

