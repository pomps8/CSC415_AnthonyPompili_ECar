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
    private var year: Int = 0
    private var mpg: Int = 0
    private var description: String = ""
    private var carImage: UIImage?
    private var safetyRating: Int = 0
    
    //basic init func
    init(name: String, year: Int, mpg: Int, description: String, carImage: UIImage, safetyRating: Int){
        self.name = name
        self.year = year
        self.mpg = mpg
        self.description = description
        self.carImage = carImage
        self.safetyRating = safetyRating
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func setYear(year: Int) {
        self.year = year
    }
    
    func getYear() -> Int {
        return year
    }
    
    func setMpg(mpg: Int) {
        self.mpg = mpg
    }
    
    func getMpg() -> Int {
        return mpg
    }
    
    func setDescription(description: String){
        self.description = description
    }
    
    func getDescription() -> String {
        return description
    }
    
    func setCarImage(carImage: UIImage){
        self.carImage = carImage
    }
    
    func getCarImage() -> UIImage {
        return carImage!
    }
    
    func setSafetyRating(safetyRating: Int){
        self.safetyRating = safetyRating
    }
    
    func getSafetyRating() -> Int {
        return safetyRating
    }
}
