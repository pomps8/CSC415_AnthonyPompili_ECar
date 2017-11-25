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
    
    //basic init func
    init(){
        
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
    
    func setBrand(brand: String) {
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
}
