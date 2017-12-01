// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: Parser.swift
// Description: Parsers specific files in the CarData folder for the app to user. This grades the year, brand, mpg(city, highway, average), and co2 for each car. The primary function returns a list of Car objects to the caller. Some help from the following link: https://stackoverflow.com/questions/43295163/swift-3-1-how-to-get-array-or-dictionary-from-csv
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import Foundation

class Parser {
    //Global Variables
    var difference = 0          //Difference in spacing if a brand name contains a , in the title, adding one more column to this row
    var carsForYear = [Car]()   //Holds all the cars for the year in xCarData.csv file
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: parseFile()
    //
    //    Parameters: year: Int //Year for file to parse
    //
    //
    //    Pre-condition: File must exist in the project and must be a valid year
    //
    //    Post-condition: List of cars in the file is returned
    //-----------------------------------------------------------------------------------------
    func parseFile(year: Int) -> [Car]{
        var data = readDataFromCSV(fileName: (String(year) + "CarData"), fileType: ".csv") //get the file
        data = cleanRows(file: data!)   //get the data
        let csvRows = csv(data: data!)  //rows in the file parsed
        var myCar: Car                  //car object created
        var start = 0                   //used to skip the first row of the table, which is the column headers
        
        //For each column per csvRows (the rows in the file)
        for columns in csvRows {
            if start != 0 {
                if columns[3] != "" || columns[0] != "" || columns[9] != "" || columns[10] != "" || columns[11] != "" || columns[8] != "" || columns[2] != "" || columns[7] != ""{
                    
                    //formatting is strange for this brand, skip
                    if columns[1] == "Roush" {
                        continue
                    }
                    //Columns are off by one for Volvo and Ferrari due to comma in their names, we account of this difference here to adjust the respective columns that are effected
                    if columns[1] == "Volvo" || columns[1] == "Ferrari" {
                        difference = 1 //difference need for these brands
                    } else {
                        difference = 0 //set difference back to 0 if it is not one of these brands
                    }
                    
                    //Car object created with data
                    myCar = Car.init(name: columns[3 + difference], year: columns[0], mpgCity: columns[9 + difference], mpgHighway: columns[10 + difference], mpgAvg: columns[11 + difference], transmission: columns[8 + difference], brand: columns[2], cylinder: columns[7 + difference], co2: columns[154 + difference])
                    
                    //add cars to list
                    carsForYear.append(myCar)
                }
                
            }
            start = 1
        } // after here, all of the cars for a given year have been processed / parsed
        carsForYear = carsForYear.sorted { $0.getBrand() < $1.getBrand()} //sort the cars in each list by Brand name
        
        return carsForYear
    }
    //=========================================================================================
    //HELPER FUNCTIONS
    //=========================================================================================
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: readDataFromCSV()
    //
    //    Parameters: fileName: String //file name to parse
    //              fileType: String   //file type to parse
    //
    //
    //    Pre-condition: File must exist in the project and must be a valid year. Helper function not developed by me.
    //
    //    Post-condition: data from the file is returned in a string.
    //-----------------------------------------------------------------------------------------
    func readDataFromCSV(fileName: String, fileType: String)-> String!{
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
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: cleanRows()
    //
    //    Parameters: file: String //file to clean out
    //
    //
    //    Pre-condition: File must exist in the project and must be a valid year. Helper function not developed by me.
    //
    //    Post-condition: data from the file is cleared (get rid of \r returns and replace with \n instead)
    //-----------------------------------------------------------------------------------------
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        return cleanFile
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: csv()
    //
    //    Parameters: data: String //data in file, returned in 2D array
    //
    //
    //
    //    Pre-condition: Data must be non-nil value
    //
    //    Post-condition: data from the file is returned in a 2D array.
    //-----------------------------------------------------------------------------------------
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
