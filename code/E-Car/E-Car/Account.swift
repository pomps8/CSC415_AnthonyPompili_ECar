//
//  Account.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/10/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//
// Account.swift contains the blueprint for the account class in E-Car, each user who wants
// to use E-Car must have an account to have access to store data / access data stored
import Foundation



class Account {
    //global variables
    private var username: String = ""
    private var password: String = ""
    private var accountNumber: String = ""
    private var email: String = ""
    private var personalCar: Car
    
    //basic init function
    init(username: String, password: String, accountNumber: String, email: String, personalCar: Car){
        self.username = username
        self.password = password
        self.accountNumber = accountNumber
        self.email = email
        self.personalCar = personalCar
    }
    
    //setters and getters for class
    func setUsername(username: String){
        self.username = username
    }
    
    func getUsername() -> String {
        return username
    }
    
    func setPassword(password: String){
        self.password = password
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setAccountNumber(accountNumber: String){
        self.accountNumber = accountNumber
    }
    
    func getAccountNumber() -> String {
        return accountNumber
    }
    
    func setEmail(email: String){
        self.email = email
    }
    
    func getEmail() -> String {
        return email
    }
    
    func setPersonalCar(personalCar: Car){
        self.personalCar = personalCar
    }
    
    func getPersonalCar() -> Car {
        return personalCar
    }
}
