//
//  PersonalCar.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//

import Foundation
import UIKit

class PersonalCar : Car {
    private var personalMpg: Int
    private var footprint: Int
    private var gasConsumed: Int
    private var milesDriven: Int
    
    init(name: String, year: Int, mpg: Int, description: String, carImage: UIImage, safetyRating: Int,
                  personalMpg: Int, footprint: Int, gasConsumed: Int, milesDriven: Int) {
        
        self.personalMpg = personalMpg
        self.footprint = footprint
        self.gasConsumed = gasConsumed
        self.milesDriven = milesDriven
        super.init(name: name, year: year, mpg: mpg, description: description, carImage: carImage, safetyRating: safetyRating)
        
    }
    
    func setPersonalMpg(personalMpg: Int){
        self.personalMpg = personalMpg
    }
    
    func getPersonalMpg() -> Int{
        return personalMpg
    }
    
    func setFootprint(footprint: Int){
        self.footprint = footprint
    }
    
    func getFootprint() -> Int {
        return footprint
    }
    
    func setGasConsumed(gasConsumed: Int){
        self.gasConsumed = gasConsumed
    }
    
    func getGasConsumed() -> Int {
        return gasConsumed
    }
    
    func setMilesDriven(milesDriven: Int){
        self.milesDriven = milesDriven
    }
    
    func getMilesDriven() -> Int {
        return milesDriven
    }
}
