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

import Foundation
import SQLite

class SQLDatabase {
    
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
    var years = [Int]()
    let startYear: Int = 2014
    let endYear: Int = 2018
    
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
    
    func getConn() -> AnySequence<Row>? {
        var result: AnySequence<Row>?
        do {
            result = try self.database.prepare(self.carsTable)
            return result!
        } catch {
            print(error)
        }
        return nil
    }
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
}
