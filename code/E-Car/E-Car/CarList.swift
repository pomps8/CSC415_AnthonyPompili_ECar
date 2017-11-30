// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: CarList.swift
// Description: This class will contain all of the cars collected from the EAP website, stored in an array. This array holds a structure called CarYearList, which holds the year and car list for a certain year group of cars.
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.
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
