//
//  Parser.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/25/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
//returns a list of cars for a given year
import Foundation

class Parser {
    var difference = 0
    var carsForYear = [Car]()
    
    func parseFile(year: Int) -> [Car]{
        
        var data = readDataFromCSV(fileName: (String(year) + "CarData"), fileType: ".csv")
        data = cleanRows(file: data!)
        let csvRows = csv(data: data!)
        var myCar: Car
        var start = 0 //used to skip the first row of the table, which is the column headers
        for columns in csvRows {
            if start != 0 {
                if columns[3] != "" || columns[0] != "" || columns[9] != "" || columns[10] != "" || columns[11] != "" || columns[8] != "" || columns[2] != "" || columns[7] != ""{
                    
                    //Columns are off by one for Volvo and Ferrari due to comma in their names, we account of this difference here to adjust the respective columns that are effected
                    if columns[1] == "Volvo" || columns[1] == "Ferrari"{
                        difference = 1
                    } else {
                        difference = 0
                    }
                    
                    myCar = Car.init(name: columns[3 + difference], year: columns[0], mpgCity: columns[9 + difference], mpgHighway: columns[10 + difference], mpgAvg: columns[11 + difference], transmission: columns[8 + difference], brand: columns[2], cylinder: columns[7 + difference])
                    
                    //Volvo and Ferrari have a comma in their names, so their n
                    
                    //print(myCar.toString())
                    carsForYear.append(myCar)
                }
                
            }
            start = 1
        } // after here, all of the cars for a given year have been processed / parsed
        carsForYear = carsForYear.sorted { $0.getBrand() < $1.getBrand()} //sort the cars in each list by Brand name
        
        
        for car in carsForYear {
            print(car.toString())
        }
        return carsForYear
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