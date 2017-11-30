// Name: Anthony Pompili
// Course: CSC 415
// Semester: Fall 2017
// Instructor: Dr. Pulimood
// Project name: E-Car
// Description: E-Car looks to show Carbon footprint of various cars in use now, from 2014-2018. Additionally,
// Filename: CarBrandsTableViewCell.swift
// Description: ViewController for the car brands list table cell, displays data in tablecell to user
// Last modified on: 12/1/2017
// Copyright © 2017 Anthony Pompili. All rights reserved.

import UIKit

class CarBrandsTableViewCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
