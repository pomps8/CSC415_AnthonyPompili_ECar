//
//  ViewCarViewController.swift
//  E-Car
//
//  Created by Anthony Pompili on 11/30/17.
//  Copyright © 2017 Anthony Pompili. All rights reserved.
//

import UIKit

class ViewCarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setPersonalCarPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        print("done")
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
