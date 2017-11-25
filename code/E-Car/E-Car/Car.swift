//
//  Car.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
// This class is the structure for any car that is saved in the application
// Used also for the PersonalCar.swift class as its parent class
import Foundation
import UIKit

class Car {
    private var name: String = ""
    private var year: String = ""
    private var mpgCity: String = ""
    private var mpgHighway: String = ""
    private var mpgAvg: String = ""
    private var transmission: String = ""
    private var brand: String = ""
    private var cylinder: String = ""
    
    //basic init func to initialize car, data will be pulled from parser in viewDidLoad init file
    init(name: String, year: String, mpgCity: String, mpgHighway: String, mpgAvg: String, transmission: String, brand: String, cylinder: String){
        setName(name: name)
        setYear(year: year)
        setMpgCity(mpgCity: mpgCity)
        setMpgHighway(mpgHighway: mpgHighway)
        setMpgAvg(mpgAvg: mpgAvg)
        setTransmission(transmission: transmission)
        setBrand(brand: brand)
        setCylinder(cylinder: cylinder)
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func setYear(year: String) {
        self.year = year
    }
    
    func getYear() -> String {
        return year
    }
    
    func setMpgCity(mpgCity: String) {
        self.mpgCity = mpgCity
    }
    
    func getMpgCity() -> String {
        return mpgCity
    }
    
    func setMpgHighway(mpgHighway: String) {
        self.mpgHighway = mpgHighway
    }
    
    func getMpgHighway() -> String {
        return mpgHighway
    }
    
    func setMpgAvg(mpgAvg: String) {
        self.mpgAvg = mpgAvg
    }
    
    func getMpgAvg() -> String {
        return mpgAvg
    }
    
    func setTransmission(transmission: String) {
        self.transmission = transmission
    }
    
    func getTransmission() -> String {
        return transmission
    }
    
    //Some brands have strange names in the list, use this to make their names simpler
    func setBrand(brand: String) {
        if brand == "\"Volvo Cars of North America"{
            self.brand = "Volvo"
            return
        } else if brand == "\"Ferrari North America"{
            self.brand = "Ferrari"
            return
        } else if brand == "\"Mitsubishi Motors Corporation" {
            self.brand = "Mitsubishi"
            return
        }
        self.brand = brand
    }
    
    func getBrand() -> String {
        return brand
    }
    
    func setCylinder(cylinder: String) {
        self.cylinder = cylinder
    }
    
    func getCylinder() -> String {
        return cylinder
    }
    
    func toString() -> String {
        return "brand: " + brand + ", name: " + name + ", year: " + year + ", tramission: " + transmission + ", cylinder: " + cylinder + ", MPGCity: " + mpgCity + ", MPGHighway" + mpgHighway + ", MPGAVG: " + mpgAvg
    }
}
