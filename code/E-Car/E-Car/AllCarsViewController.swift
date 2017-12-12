// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: AllCarsViewController.swift
// Description: This class creates the view controller to see all of the data of the cars listed in the database. Seperating each data type (brand, name, year, transmission, cylinders)
// Last modified on: 12/1/2017


import Foundation
import UIKit
import SQLite

class AllCarsViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    //Global Variables
    var years = [Int]()             //Array that holds all the years to display (currently 2018-2014 are the only accepted years)
    var brands = [String]()         //Array that holds all the brands to display
    var names = [String]()          //Array that holds all the names / models to display
    var transmissions = [String]()  //Array that holds all the transmissions to display
    var cylinders = [String]()      //Array that holds all the cylinders to display
    var carToSend: Car?             //Global car to pass to ViewCarViewController once queried
    var startYear: Int = 2014       //Starting Year
    var endYear: Int = 2018         //Ending Year
    var myId: Int = 1               //Id of car were looking at
    
    var db: SQLDatabase?            //database set up
    var database: Connection!       //global variable for database connection
    let carsTable = Table("Cars")   //table to query for cars
    let id = Expression<Int>("id")  //unique id for each car in the database
    let year = Expression<String>("year")                   //column for year
    let brand = Expression<String>("brand")                 //column for brand
    let name = Expression<String>("name")                   //column for name
    let transmission = Expression<String>("transmission")   //column for transmission
    let cylinder = Expression<String>("cylinder")           //column for cylinder
    let mpgCity = Expression<String>("mpgCity")             //column for mpgCity
    let mpgHighway = Expression<String>("mpgHighway")       //column for mpgHighway
    let mpgAvg = Expression<String>("mpgAvg")               //column for mpgAverage
    let co2 = Expression<String>("co2")                     //column for co2
    
    //Data to grab values in UIPickers on screen when the query button is pressed
    var yearHere = ""
    var selectedYear = 0
    var selectedBrand = 0
    var selectedName = 0
    var selectedTransmission = 0
    var selectedCylinder = 0
    var myCar: Car? //car object to hold data that was queried
    
    //UIPickers to display data on the screen that was collected from the parser
    @IBOutlet weak var yearPickerLabel: UIPickerView!
    @IBOutlet weak var brandPickerLabel: UIPickerView!
    @IBOutlet weak var namePickerLabel: UIPickerView!
    @IBOutlet weak var transmissionPickerLabel: UIPickerView!
    @IBOutlet weak var cylinderPickerLabel: UIPickerView!
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: viewDidLoad()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: View must grab all data from database to display it
    //
    //    Post-condition: All data is displayed to the user's screen
    //-----------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLDatabase() //set up database to use
        
        //populate year array with numbers from 2010 to 2018
        for i in startYear ... endYear {
            years.append(i)
        }
        years = years.reversed() //flip years to start with 2018 in UIPicker
        
        //get all unique values in lists to display from database
        brands = (db?.getUniqueBrands().sorted())!
        names = (db?.getUniqueName().sorted())!
        transmissions = (db?.getUniqueTransmission().sorted())!
        cylinders = (db?.getUniqueCylinder().sorted())!
        
        
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: numberOfComponents()
    //
    //    Parameters: pickerView: UIPickerView: Int //holds number of columns in the UIPicker (date picker is example of having 3, versus this one, which has 1)
    //
    //
    //    Pre-condition: Must be subclass of: UIPickerViewDataSource, UIPickerViewDelegate
    //
    //    Post-condition: Number of columns is set for the UIPickers
    //-----------------------------------------------------------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: pickerView()
    //
    //    Parameters: pickerView: UIPickerView              //Pickerview in view
    //                          titleForRow row: Int        //row in UIPicker
    //                          forComponent component: Int //Comonent in UIPicker
    //
    //
    //    Pre-condition: Must be subclass of: UIPickerViewDataSource, UIPickerViewDelegate
    //
    //    Post-condition: Names of columns is set for the UIPickers
    //-----------------------------------------------------------------------------------------
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var titleOfRow = ""
        if pickerView == yearPickerLabel {
            titleOfRow = String(years[row])
        } else if pickerView == brandPickerLabel {
            titleOfRow = brands[row]
        } else if pickerView == namePickerLabel {
            titleOfRow = names[row]
        } else if pickerView == transmissionPickerLabel {
            titleOfRow = transmissions[row]
        } else if pickerView == cylinderPickerLabel {
            titleOfRow = cylinders[row]
        }
        return titleOfRow
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: pickerView()
    //
    //    Parameters: pickerView: UIPickerView              //Pickerview in view
    //                          titleForRow row: Int        //row in UIPicker
    //                          forComponent component: Int //Comonent in UIPicker
    //
    //
    //    Pre-condition: Must be subclass of: UIPickerViewDataSource, UIPickerViewDelegate
    //
    //    Post-condition: Number of rows is set for the UIPickers
    //-----------------------------------------------------------------------------------------
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rows: Int = years.count
        
        if pickerView == brandPickerLabel {
            rows = brands.count
        } else if pickerView == namePickerLabel {
            rows = names.count
        } else if pickerView == transmissionPickerLabel {
            rows = transmissions.count
        }
        return rows
    }
    
    //Needed Function when subclass of: UIPickerDataSource, UIPickerViewDelegate, holds no functionality
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: submitButtonPressed()
    //
    //    Parameters: sender: UIButton
    //
    //
    //    Pre-condition: Must be selections in all UIPickers (set by default)
    //
    //    Post-condition: Data in global variables is set to these values
    //-----------------------------------------------------------------------------------------
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        selectedYear = yearPickerLabel.selectedRow(inComponent: 0)
        selectedBrand = brandPickerLabel.selectedRow(inComponent: 0)
        selectedName = namePickerLabel.selectedRow(inComponent: 0)
        selectedTransmission = transmissionPickerLabel.selectedRow(inComponent: 0)
        selectedCylinder = cylinderPickerLabel.selectedRow(inComponent: 0)
        
        print("in submit")
        print(years[selectedYear])
        print(brands[selectedBrand])
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
        print("BOYYYYYYYYYYYYYYASDFADSFASDFASD;FJAS;LDFJA;SLDJF;ALSDKJF;ALSDFJA;SLKDJF")
        selectedYear = yearPickerLabel.selectedRow(inComponent: 0)
        selectedBrand = brandPickerLabel.selectedRow(inComponent: 0)
        selectedName = namePickerLabel.selectedRow(inComponent: 0)
        selectedTransmission = transmissionPickerLabel.selectedRow(inComponent: 0)
        selectedCylinder = cylinderPickerLabel.selectedRow(inComponent: 0)
        //Segue to go to ViewCarViewController is called "showCar", so we know which screen were trying to go to here
        if identifier == "showCar" {
            // query to get car from database
            myCar = db?.getCar(year: String(years[selectedYear]), brand: brands[selectedBrand], name: names[selectedName], transmssion: transmissions[selectedTransmission], cylinder: cylinders[selectedCylinder])
            print(myCar?.toString())
            //make sure myCar has value
            if myCar == nil {
                print("No car found")
                
                //Display allert if no car is found with this data passed in the query
                let alert = UIAlertController(title: "No Car Found", message: "No Car Found. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
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
