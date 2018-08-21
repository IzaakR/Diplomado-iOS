//
//  ViewController.swift
//  Calculator
//
//  Created by Rodriguez Isaac on 8/18/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCalculate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionNumber(_ sender: UIButton) {
        labelCalculate.text = String(sender.tag)
    }
}
