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
        
        var data = readDataFromCSV(fileName: "2018CarData", fileType: ".csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        var myCar: Car
        var start = 0 //used to skip the first row of the table, which is the column headers
        for columns in csvRows {
            if start != 0 {
                if columns[3] != "" || columns[0] != "" || columns[9] != "" || columns[10] != "" || columns[11] != "" || columns[8] != "" || columns[2] != "" || columns[7] != ""{
                    myCar = Car.init(name: columns[3], year: columns[0], mpgCity: columns[9], mpgHighway: columns[10], mpgAvg: columns[11], transmission: columns[8], brand: columns[2], cylinder: columns[7])
                    print(myCar.toString())
                }
                
            }
            start = 1
        }
        //print(csvRows[10])
        //print(csvRows[1][1])
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        //takes us back to login screen
        presentingViewController?.dismiss(animated: true, completion: nil)
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
}

