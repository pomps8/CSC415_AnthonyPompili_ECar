// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: CarYearsTableViewController.swift
// Description: ViewController for the car list table, displays data in table to user. 
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import UIKit
import SQLite

class CarYearsTableViewController: UITableViewController {

    //Array that holds all the years to display (currently 2018-2010 are the only accepted years
    var years = [Int]()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLDatabase()
        
        //populate year array with numbers from 2010 to 2018
        for i in startYear ... endYear {
            years.append(i)
        }
        years = years.reversed()
        
        /*
        for c in cars {
            print(c.toString())
        }
        */
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return years.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CarYearsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CarYearsTableViewCell else {
            fatalError("The dequeued cell is not an instance of CarYearsTableViewCell")
        }
        let year = years[indexPath.row]
        // Configure the cell...
        cell.yearLabel.text = String(year)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let year = 2000 + (18 - indexPath.row)
        print("year: \(year)")
        

        //db?.printForYear(year: year)
        //db?.getForBrand(brand: "Porsche")
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
