// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: Car.swift
// Description: This class is the structure for any car that is saved in the application. Used also for the PersonalCar.swift class as its parent class
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import Foundation
import UIKit

class Car {
    
    //Global Variables
    private var name: String = ""           //Holds name / model for car
    private var year: String = ""           //Holds year for car
    private var mpgCity: String = ""        //Holds MPGCity for car
    private var mpgHighway: String = ""     //Holds MPGHighway for car
    private var mpgAvg: String = ""         //Holds MPGAverage for car
    private var transmission: String = ""   //Holds transmission for car
    private var brand: String = ""          //Holds Brand for car
    private var cylinder: String = ""       //Holds cylinders for car
    private var co2: String = ""            //Holds co2 pollutent for car
    
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: init()
    //
    //
    //    Parameters: name: String            //Holds name / model for car
    //              year: String              //Holds year for car
    //              mpgCity: String           //Holds MPGCity for car
    //              mpgHighway: String        //Holds MPGHighway for car
    //              mpgAvg: String            //Holds MPGAverage for car
    //              transmission: String      //Holds transmission for car
    //              brand: String             //Holds Brand for car
    //              cylinder: String          //Holds cylinders for car
    //              co2: String               //Holds co2 pollutent for car
    //
    //
    //    Pre-condition: Initalize function to set up the structure of a car
    //
    //    Post-condition: Car object is created with respective data passed in
    //-----------------------------------------------------------------------------------------
    init(name: String, year: String, mpgCity: String, mpgHighway: String, mpgAvg: String, transmission: String, brand: String, cylinder: String, co2: String){
        
        //All Setters are used to proper variable storage
        setName(name: name)
        setYear(year: year)
        setMpgCity(mpgCity: mpgCity)
        setMpgHighway(mpgHighway: mpgHighway)
        setMpgAvg(mpgAvg: mpgAvg)
        setTransmission(transmission: transmission)
        setBrand(brand: brand)
        setCylinder(cylinder: cylinder)
        setCo2(co2: co2)
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setName()
    //
    //    Parameters: name: String          //Holds name / model for car
    //
    //
    //
    //    Pre-condition: name must be a string
    //
    //    Post-condition: class variable name is set
    //-----------------------------------------------------------------------------------------
    func setName(name: String){
        self.name = name
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getName()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: name must hold a strong
    //
    //    Post-condition: string name is returned
    //-----------------------------------------------------------------------------------------
    func getName() -> String {
        return name
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setYear()
    //
    //    Parameters: year: String          //Holds year for car
    //
    //
    //
    //    Pre-condition: year must be a string
    //
    //    Post-condition: class variable year is set
    //-----------------------------------------------------------------------------------------
    func setYear(year: String) {
        self.year = year
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getYear()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: year must be a string
    //
    //    Post-condition: class variable year is returned
    //-----------------------------------------------------------------------------------------
    func getYear() -> String {
        return year
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setMpgCity()
    //
    //    Parameters: mpgCity: String          //Holds mpgCity for car
    //
    //
    //
    //    Pre-condition: mpgCity must be a string
    //
    //    Post-condition: class variable mpgCity is set
    //-----------------------------------------------------------------------------------------
    func setMpgCity(mpgCity: String) {
        self.mpgCity = mpgCity
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getMpgCity()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: mpgCity must be a string
    //
    //    Post-condition: class variable mpgCity is returned
    //-----------------------------------------------------------------------------------------
    func getMpgCity() -> String {
        return mpgCity
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setMpgHighway()
    //
    //    Parameters: mpgHighway: String          //Holds mpgHighway for car
    //
    //
    //
    //    Pre-condition: mpgHighway must be a string
    //
    //    Post-condition: class variable mpgHighway is set
    //-----------------------------------------------------------------------------------------
    func setMpgHighway(mpgHighway: String) {
        self.mpgHighway = mpgHighway
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getMpgHighway()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: mpgHighway must hold a strong
    //
    //    Post-condition: string mpgHighway is returned
    //-----------------------------------------------------------------------------------------
    func getMpgHighway() -> String {
        return mpgHighway
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setMpgAvg()
    //
    //    Parameters: mpgAvg: String          //Holds mpgAvg for car
    //
    //
    //
    //    Pre-condition: mpgAvg must be a string
    //
    //    Post-condition: class variable mpgAvg is set
    //-----------------------------------------------------------------------------------------
    func setMpgAvg(mpgAvg: String) {
        self.mpgAvg = mpgAvg
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getMpgAvg()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: mpgAvg must hold a strong
    //
    //    Post-condition: string mpgAvg is returned
    //-----------------------------------------------------------------------------------------
    func getMpgAvg() -> String {
        return mpgAvg
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setTransmission()
    //
    //    Parameters: transmission: String          //Holds transmission for car
    //
    //
    //
    //    Pre-condition: transmission must be a string
    //
    //    Post-condition: class variable transmission is set
    //-----------------------------------------------------------------------------------------
    func setTransmission(transmission: String) {
        self.transmission = transmission
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getTransmission()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: transmission must hold a strong
    //
    //    Post-condition: string transmission is returned
    //-----------------------------------------------------------------------------------------
    func getTransmission() -> String {
        return transmission
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setBrand()
    //
    //    Parameters: brand: String          //Holds brand for car
    //
    //
    //
    //    Pre-condition: brand must be a string.
    //      Some brands have strange names in the list, use this to make their names simpler
    //
    //    Post-condition: class variable brand is set
    //-----------------------------------------------------------------------------------------
    func setBrand(brand: String) {
        if brand == "\"Volvo Cars of North America"{
            self.brand = "Volvo"
            return
        } else if brand == "\"Ferrari North America"{
            self.brand = "Ferrari"
            return
        } else if brand == "Mitsubishi Motors Corporation" {
            self.brand = "Mitsubishi"
            return
        } else if brand == "HYUNDAI MOTOR COMPANY" {
            self.brand = "Hyundai"
            return
        } else if brand == "KIA MOTORS CORPORATION" {
            self.brand = "KIA"
            return
        } else if brand == "HYUNDAI MOTOR COMPANY" {
            self.brand = "Hyundai"
            return
        } else if brand == "HYUNDAI MOTOR COMPANY" {
            self.brand = "Hyundai"
            return
        } else if brand == "Aston Martin Lagonda Ltd" {
            self.brand = "Aston Martin"
            return
        } else if brand == "Rolls-Royce Motor Cars Limited" {
            self.brand = "Rolls-Royce"
        }
        //If not one of the brands above, just set the brand
        self.brand = brand
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getBrand()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: brand must hold a strong
    //
    //    Post-condition: string brand is returned
    //-----------------------------------------------------------------------------------------
    func getBrand() -> String {
        return brand
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setCylinder()
    //
    //    Parameters: cylinder: String          //Holds cylinder for car
    //
    //
    //
    //    Pre-condition: cylinder must be a string
    //
    //    Post-condition: class variable cylinder is set
    //-----------------------------------------------------------------------------------------
    func setCylinder(cylinder: String) {
        self.cylinder = cylinder
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getCylinder()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: cylinder must hold a strong
    //
    //    Post-condition: string cylinder is returned
    //-----------------------------------------------------------------------------------------
    func getCylinder() -> String {
        return cylinder
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: setCo2()
    //
    //    Parameters: co2: String          //Holds co2 for car
    //
    //
    //
    //    Pre-condition: co2 must be a string
    //
    //    Post-condition: class variable co2 is set
    //-----------------------------------------------------------------------------------------
    func setCo2(co2: String){
        self.co2 = co2
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: getCo2()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: co2 must hold a strong
    //
    //    Post-condition: string co2 is returned
    //-----------------------------------------------------------------------------------------
    func getCo2() -> String {
        return co2
    }
    
    //-----------------------------------------------------------------------------------------
    //
    //  Function: toString()
    //
    //    Parameters: none
    //
    //
    //
    //    Pre-condition: Class variables for car must contain strings
    //
    //    Post-condition: string containing all class variables is returned
    //-----------------------------------------------------------------------------------------
    func toString() -> String {
        return "brand: " + brand + ", name: " + name + ", year: " + year + ", tramission: " + transmission + ", cylinder: " + cylinder + ", MPGCity: " + mpgCity + ", MPGHighway: " + mpgHighway + ", MPGAVG: " + mpgAvg + ", CO2: " + co2
    }
}
