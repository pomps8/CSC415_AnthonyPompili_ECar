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
    //Array that holds all the years to display (currently 2018-2010 are the only accepted years
    var years = [Int]()
    var brands = [String]()
    var names = [String]()
    var transmissions = [String]()
    var cylinders = [String]()
    
    var startYear: Int = 2014
    var endYear: Int = 2018
    var carList = CarList()
    var db: SQLDatabase?
    var database: Connection! //global variable for database
    let carsTable = Table("Cars")
    let id = Expression<Int>("id") //unique id for each car in the database
    let year = Expression<String>("year")
    let brand = Expression<String>("brand")
    let name = Expression<String>("name")
    let transmission = Expression<String>("transmission")
    let cylinder = Expression<String>("cylinder")
    let mpgCity = Expression<String>("mpgCity")
    let mpgHighway = Expression<String>("mpgHighway")
    let mpgAvg = Expression<String>("mpgAvg")
    let co2 = Expression<String>("co2")
    
    @IBOutlet weak var yearPickerLabel: UIPickerView!
    @IBOutlet weak var brandPickerLabel: UIPickerView!
    @IBOutlet weak var namePickerLabel: UIPickerView!
    @IBOutlet weak var transmissionPickerLabel: UIPickerView!
    @IBOutlet weak var cylinderPickerLabel: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLDatabase()
        
        //populate year array with numbers from 2010 to 2018
        for i in startYear ... endYear {
            years.append(i)
        }
        years = years.reversed()
        
        brands = (db?.getUniqueBrands().sorted())!
        names = (db?.getUniqueName().sorted())!
        transmissions = (db?.getUniqueTransmission().sorted())!
        cylinders = (db?.getUniqueCylinder().sorted())!
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        //let selectedYearPicker = pickerData[yearPicker.selectedRow(inComponent:
        //print(selectedYearPicker)
        let selectedYear = yearPickerLabel.selectedRow(inComponent: 0)
        let selectedBrand = brandPickerLabel.selectedRow(inComponent: 0)
        let selectedName = namePickerLabel.selectedRow(inComponent: 0)
        let selectedTransmission = transmissionPickerLabel.selectedRow(inComponent: 0)
        let selectedCylinder = cylinderPickerLabel.selectedRow(inComponent: 0)
        print(years[selectedYear])
        print(brands[selectedBrand])
        print(names[selectedName])
        print(transmissions[selectedTransmission])
        print(cylinders[selectedCylinder])
        
    }
}
