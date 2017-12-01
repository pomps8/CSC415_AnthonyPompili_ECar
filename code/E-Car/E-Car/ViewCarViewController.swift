//
//  ViewCarViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/30/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//

import UIKit
import SQLite

class ViewCarViewController: UIViewController {

    //Global Variables
    
    //Outlets for displaying data
    @IBOutlet weak var footprintLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var cylindersLabel: UILabel!
    @IBOutlet weak var mpgCityLabel: UILabel!
    @IBOutlet weak var mpgHighwayLabel: UILabel!
    @IBOutlet weak var mpgAverageLabel: UILabel!
    @IBOutlet weak var milesInput: UITextField!
    
    //Variables that get data from AllCarsViewController.swift once grabbed from database. Stored here first
    var yearToDisplay: String?
    var brandToDisplay: String?
    var modelToDisplay: String?
    var transmissionToDisplay: String?
    var cylinderToDisplay: String?
    var mpgCityToDisplay: String?
    var mpgHighwayToDisplay: String?
    var mpgAverageToDisplay: String?
    var co2: String?
    var carId: Int?
    
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
    let co2db = Expression<String>("co2")                     //column for co2
    
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: viewDidLoad()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Data base data has been passed int
    //
    //    Post-condition: All database data is displayed to user's screen
    //-----------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLDatabase() //set up database to use
        //Set labels to values or discriptions + values
        yearLabel.text = yearToDisplay
        brandLabel.text = brandToDisplay
        modelLabel.text = modelToDisplay
        transmissionLabel.text = "Transmission: " + transmissionToDisplay!
        cylindersLabel.text = "Number of Cylinders: " + cylinderToDisplay!
        mpgCityLabel.text = "City MPG: " + mpgCityToDisplay!
        mpgHighwayLabel.text = "Highway MPG: " + mpgHighwayToDisplay!
        mpgAverageLabel.text = "Average MPG: " + mpgAverageToDisplay!
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
    //  Function: setPersonalCarPressed()
    //
    //    Parameters: sender: UIButton //Button pressed to dismiss back to mainmenu
    //
    //
    //    Pre-condition: Valid data displaying to push to database
    //
    //    Post-condition: Database is updated with new car data
    //-----------------------------------------------------------------------------------------
    @IBAction func setPersonalCarPressed(_ sender: UIButton) {
        db?.setPersonalCar(year: yearToDisplay!, brand: brandToDisplay!, name: modelToDisplay!, transmssion: transmissionToDisplay!, cylinder: cylinderToDisplay!)
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: calulateFootprintPressed()
    //
    //    Parameters: sender: UIButton //Button pressed to dismiss back to mainmenu
    //
    //
    //    Pre-condition: Valid data to calculate footprint
    //
    //    Post-condition: Carbon is updated with corresponding data if valid, else a a message "Invalid Data" is displayed
    //-----------------------------------------------------------------------------------------
    @IBAction func calulateFootprintPressed(_ sender: UIButton) {
        var myMiles = 0
        var result = 0
        if let miles = milesInput.text {
            //data passed is not a valud number and less than 1000000
            if Int(miles) == nil || Int(miles)! < 0 || Int(miles)! > 1000000{
                footprintLabel.text = "Invalid Data"
                return
            }
            myMiles = Int(miles)!
        }
        result = myMiles * Int(co2!)!
        footprintLabel.text = String(result) + "kg CO2"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
