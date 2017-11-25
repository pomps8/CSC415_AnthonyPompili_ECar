//
//  CarYearsTableViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/25/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//

import UIKit

class CarYearsTableViewController: UITableViewController {

    //Array that holds all the years to display (currently 2018-2010 are the only accepted years
    var years = [Int]()
    var startYear: Int = 2010
    var endYear: Int = 2018
    var carList = CarList()
    var carsForYear = [Car]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //populate year array with numbers from 2010 to 2018
        for i in startYear ... endYear {
            years.append(i)
        }
        years = years.reversed()
        /*
        for year in years {
            
        }
 */
        var currentYear = 2018
        var data = readDataFromCSV(fileName: (String(currentYear) + "CarData"), fileType: ".csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        var myCar: Car
        var start = 0 //used to skip the first row of the table, which is the column headers
        for columns in csvRows {
            if start != 0 {
                if columns[3] != "" || columns[0] != "" || columns[9] != "" || columns[10] != "" || columns[11] != "" || columns[8] != "" || columns[2] != "" || columns[7] != ""{
                    myCar = Car.init(name: columns[3], year: columns[0], mpgCity: columns[9], mpgHighway: columns[10], mpgAvg: columns[11], transmission: columns[8], brand: columns[2], cylinder: columns[7])
                    //print(myCar.toString())
                    carsForYear.append(myCar)
                }
                
            }
            start = 1
        } // after here, all of the cars for a given year have been processed / parsed
        carList.addCar(year: currentYear, carList: carsForYear)
        //print(uniqueBrands)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        
        return result
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
