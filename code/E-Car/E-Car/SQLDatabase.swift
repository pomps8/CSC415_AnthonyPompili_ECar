// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: SQLDatabse.swift
// Description: Creates a connection with the database to store all parsed data + user data for personal car. Table is only created if there is no table with that name yet.
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.
// I had assistance developing this module thanks to this video: https://www.youtube.com/watch?v=c4wLS9py1rU&t=2250s on youtube.com
import Foundation
import SQLite

class SQLDatabase {
    
    //Global Variables
    var database: Connection! //global variable for database
    let carsTable = Table("Cars") //table holds all cars
    
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
    var years = [Int]()
    let startYear: Int = 2014
    let endYear: Int = 2018
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: init()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: No database must be active, if there is, no table is made
    //
    //    Post-condition: View controller is loaded, displays view to user's screen
    //-----------------------------------------------------------------------------------------
    init(){
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) //create database file if there isn't one
            let fileUrl = documentDirectory.appendingPathComponent("Cars").appendingPathExtension("sqlite3") //recomended by Github page for SQLite README.rd with name "Cars.sqlite3"
            let database = try Connection(fileUrl.path) //set up database to the path created in the line above, creates connection to save data to this file
            self.database = database
        } catch {
            print(error)
        }
        
        createTable() //create the table after the database is initalized
        
        
        
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: createTable()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: creates table with specified rows
    //
    //    Post-condition: tables is set up and ready to use
    //-----------------------------------------------------------------------------------------
    private func createTable() {
        //add the columns to this new table upon creation, setting the "id" attribute as our unique id & primary key
        let createTable = self.carsTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.year)
            table.column(self.brand)
            table.column(self.name)
            table.column(self.transmission)
            table.column(self.cylinder)
            table.column(self.mpgCity)
            table.column(self.mpgHighway)
            table.column(self.mpgAvg)
            table.column(self.co2)
        }
        
        //try to run create table
        do {
            try self.database.run(createTable)
            print("Created Table")
            var cars = [Car]()
            let parser = Parser()
            for i in startYear ... endYear {
                years.append(i)
            }
            
            years = years.reversed()
            for year in years {
                cars = parser.parseFile(year: year)
                for car in cars {
                    insertCar(car: car) //insert car into database after parsing of each year
                }
                cars.removeAll() //clear out array
            }
        } catch {
            print(error)
        }
    }
    
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: insertCar()
    //
    //    Parameters: car: Car
    //
    //
    //    Pre-condition: car must be a valid car
    //
    //    Post-condition: added to the list if no erros with database
    //-----------------------------------------------------------------------------------------
    func insertCar(car: Car){
        //take car data, add it to the table respectively
        let insertCar = self.carsTable.insert(self.year <- car.getYear(), self.brand <- car.getBrand(), self.name <- car.getName(), self.transmission <- car.getTransmission(),
                                              self.cylinder <- car.getCylinder(), self.mpgCity <- car.getMpgCity(), self.mpgHighway <- car.getMpgHighway(), self.mpgAvg <- car.getMpgAvg(), self.co2 <- car.getCo2())
        do {
            try self.database.run(insertCar) //run the query to the database
        } catch {
            print(error)
        }
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: list()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: must be cars in db
    //
    //    Post-condition: all cars are printed to console. Debugging use only
    //-----------------------------------------------------------------------------------------
    func listCar() {
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database
            for c in cars {
                print("id: \(c[self.id]) brand: \(c[self.brand]), name: \(c[self.name]), year: \(c[self.year]), tramission: \(c[self.transmission]), cylinder: \(c[self.cylinder]), MPGCity: \(c[self.mpgCity]), MPGHighway: \(c[self.mpgHighway]), MPGAVG: \(c[self.mpgAvg]), CO2: \(c[self.co2]) ")
            }
        } catch {
            print(error)
        }
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getForYear()
    //
    //    Parameters: year: Int
    //
    //
    //    Pre-condition: year must be valid
    //
    //    Post-condition: get a valid year
    //-----------------------------------------------------------------------------------------
    func getForYear(year: Int){
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database
            for c in cars {
                if c[self.year] == String(year) {
                    print("id: \(c[self.id]) brand: \(c[self.brand]), name: \(c[self.name]), year: \(c[self.year]), tramission: \(c[self.transmission]), cylinder: \(c[self.cylinder]), MPGCity: \(c[self.mpgCity]), MPGHighway: \(c[self.mpgHighway]), MPGAVG: \(c[self.mpgAvg]), CO2: \(c[self.co2]) ")
                }
                
            }
        } catch {
            print(error)
        }
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getUniqueBrands()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Database must be set up
    //
    //    Post-condition: list of unique brands is returned
    //-----------------------------------------------------------------------------------------
    func getUniqueBrands() -> [String] {
        var uniqueBrands = [String]()
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database and add unique brand to list
            for c in cars {
                
                if !uniqueBrands.contains(c[self.brand]){
                    uniqueBrands.append(c[self.brand])
                }
                
            }
        } catch {
            print(error)
        }
        return uniqueBrands
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getUniqueName()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Database must be set up
    //
    //    Post-condition: list of unique names is returned
    //-----------------------------------------------------------------------------------------
    func getUniqueName() -> [String] {
        var uniqueNames = [String]()
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database and add unique name to list
            for c in cars {
                
                if !uniqueNames.contains(c[self.name]){
                    uniqueNames.append(c[self.name])
                }
                
            }
        } catch {
            print(error)
        }
        return uniqueNames
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getUniqueTransmission()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Database must be set up
    //
    //    Post-condition: list of unique transmissions is returned
    //-----------------------------------------------------------------------------------------
    func getUniqueTransmission() -> [String] {
        var uniqueTransmission = [String]()
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database and add unique name to list
            for c in cars {
                
                if !uniqueTransmission.contains(c[self.transmission]){
                    uniqueTransmission.append(c[self.transmission])
                }
                
            }
        } catch {
            print(error)
        }
        return uniqueTransmission
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getUniqueCylinder()
    //
    //    Parameters: none
    //
    //
    //    Pre-condition: Database must be set up
    //
    //    Post-condition: list of unique cylinders is returned
    //-----------------------------------------------------------------------------------------
    func getUniqueCylinder() -> [String] {
        var uniqueCylinder = [String]()
        do {
            let cars = try self.database.prepare(self.carsTable)
            
            //simple for loop to print all cars stored in the database and add unique name to list
            for c in cars {
                
                if !uniqueCylinder.contains(c[self.cylinder]){
                    uniqueCylinder.append(c[self.cylinder])
                }
                
            }
        } catch {
            print(error)
        }
        return uniqueCylinder
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getCar()
    //
    //    Parameters: year, brand, name, transmission, cylinder: string //attributes of car to search for
    //
    //
    //    Pre-condition: Database must be set up
    //
    //    Post-condition: list of unique brands is returned
    //-----------------------------------------------------------------------------------------
    func getCar(year: String, brand: String, name: String, transmssion: String, cylinder: String) -> Car?{
        var carToRet: Car?
        let query = self.carsTable.filter(self.year == year && self.brand == brand && self.name == name && self.transmission == transmission && self.cylinder == cylinder)
        do {
            for car  in try self.database.prepare(query) {
                //get first car find and set it equal to global variable to return later
                carToRet = Car(name: car[self.name], year: car[self.year], mpgCity: car[self.mpgCity], mpgHighway: car[self.mpgHighway], mpgAvg: car[self.mpgAvg], transmission: car[self.transmission], brand: car[self.brand], cylinder: car[self.cylinder], co2: car[self.co2])
                break
            }
        } catch {
            print(error)
            print("not complete")
        }
        return carToRet
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setPersonalCar()
    //
    //    Parameters: year, brand, name, transmission, cylinder: string //attributes of car to search for
    //
    //
    //    Pre-condition: car must exists to use func
    //
    //    Post-condition: personal car is set
    //-----------------------------------------------------------------------------------------
    func setPersonalCar(year: String, brand: String, name: String, transmssion: String, cylinder: String){
        print("Set personal car")
        var carToRet: Car? = nil
        var row: Int = 0
        let query = self.carsTable.filter(self.year == year && self.brand == brand && self.name == name && self.transmission == transmission && self.cylinder == cylinder)
        do {
            for car  in try self.database.prepare(query) {
                row = car[self.id]
                carToRet = Car(name: car[self.name], year: car[self.year], mpgCity: car[self.mpgCity], mpgHighway: car[self.mpgHighway], mpgAvg: car[self.mpgAvg], transmission: car[self.transmission], brand: car[self.brand], cylinder: car[self.cylinder], co2: car[self.co2])
                break
            }
        } catch {
            print(error)
            print("not complete")
        }
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentDirectory = paths.object(at: 0) as! String
        
        let path = documentDirectory.appending("personalCar.plist")
        let dict: NSMutableDictionary = [:]
        dict.setObject(String(row), forKey: "PersonalCarId" as NSCopying)
        dict.write(toFile: path, atomically: false)
        
        print("Personal Car row: " + String(row))
    }
}
