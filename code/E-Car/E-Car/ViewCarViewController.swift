//
//  ViewCarViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/30/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//

import UIKit

class ViewCarViewController: UIViewController {

    @IBOutlet weak var footprintLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var cylindersLabel: UILabel!
    @IBOutlet weak var mpgCityLabel: UILabel!
    @IBOutlet weak var mpgHighwayLabel: UILabel!
    @IBOutlet weak var mpgAverageLabel: UILabel!
    @IBOutlet weak var milesInput: UITextField!
    var yearToDisplay: String?
    var brandToDisplay: String?
    var modelToDisplay: String?
    var transmissionToDisplay: String?
    var cylinderToDisplay: String?
    var mpgCityToDisplay: String?
    var mpgHighwayToDisplay: String?
    var mpgAverageToDisplay: String?
    var co2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        yearLabel.text = yearToDisplay
        brandLabel.text = brandToDisplay
        modelLabel.text = modelToDisplay
        transmissionLabel.text = "Transmission: " + transmissionToDisplay!
        cylindersLabel.text = "Number of Cylinders: " + cylinderToDisplay!
        mpgCityLabel.text = "City MPG: " + mpgCityToDisplay!
        mpgHighwayLabel.text = "Highway MPG: " + mpgHighwayToDisplay!
        mpgAverageLabel.text = "Average MPG: " + mpgAverageToDisplay!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setPersonalCarPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func setPresonalCarPressed(_ sender: UIButton) {
    }
    
    @IBAction func calulateFootprintPressed(_ sender: UIButton) {
        var myMiles = 0
        var result = 0
        if let miles = milesInput.text {
            myMiles = Int(miles)!
        }
        result = myMiles * Int(co2!)!
        footprintLabel.text = String(result) + "kg CO2"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
