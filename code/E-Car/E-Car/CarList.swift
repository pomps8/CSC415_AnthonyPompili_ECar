//
//  CarList.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
//This class will contain all of the cars collected from the EAP website, stored in an array. This array holds a structure called CarYearList, which holds the year and car list for a certain year group of cars.
import Foundation

class CarList {
    
    var carsForYear = [Car]()
    var difference = 0
    //Array to hold CarYearList Values
    private var cars = [CarYearList]()
    
    //basic init func to initialize the carList variable
    init(){
        
    }
    
    //func returns all the CarYearLists with all the years and car lists in this list
    func getCars() -> [CarYearList]{
        return cars
    }
    
    func addCar(year: Int, carList: [Car]){
        cars.append(CarYearList.init(year: year, carList: carList))
    }

}

//Struct that contains basic structure of a carlist. The basic structure is a "year" and a car list, that the parser in the viewDidLoad() will send this
struct CarYearList {
    var year: Int = 0
    var carList = [Car]()
    
    init(year: Int, carList: [Car]){
        self.year = year
        self.carList = carList
    }
}
