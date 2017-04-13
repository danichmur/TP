//
//  ViewController.swift
//  TP_Lab6_3
//
//  Created by Daniel Muraveyko on 09/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbAge: UITextField!
    @IBOutlet weak var tbGrowht: UITextField!
    @IBOutlet weak var tbWeight: UITextField!
    @IBOutlet weak var scSex: UISegmentedControl!
    @IBOutlet weak var scTraining: UISegmentedControl!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Calculate(_ sender: Any) {
        var bmr: Double = 0
        var bmi: Double = 0
        if let age: Int = Int(tbAge.text!) {
            if let height: Int = Int(tbGrowht.text!) {
                if let weight: Int = Int(tbWeight.text!) {
                    switch scSex.selectedSegmentIndex {
                        case 0:
                            bmr = 88.362 + 13.397 * Double(weight) + 4.799 *
                                Double(height) - 5.677 * Double(age)
                        case 1:
                            bmr = 447.593 + 9.247 * Double(weight) + 3.098 *
                                Double(height) - 4.330 * Double(age)
                        default:
                            bmr = 0
                    }
                    bmi = Double(weight) / pow(Double(height) / 100, 2)
                }
            }
        }
        let factor = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor = factor[scTraining.selectedSegmentIndex]
        bmr *= selectedFactor
       lbResult.text = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела \(Int(bmi))."
    }
}

