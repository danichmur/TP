//
//  ViewController.swift
//  TP_Lab7.3
//
//  Created by Daniel Muraveyko on 21/04/2017.
//  Copyright © 2017 Daniel Muraveyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchIndicator: UILabel!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        switchIndicator.textColor = UIColor.white
        switchIndicator.text = "Background image: bg1.jpg"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backgroundSwitchTapped(_ sender: Any) {
        if backgroundSwitch.isOn {
            switchIndicator.text = "Background image: bg1.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        }
        else
        {
            switchIndicator.text = "Background image: bg2.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
        }
    }
}

