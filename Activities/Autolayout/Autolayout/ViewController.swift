//
//  ViewController.swift
//  Autolayout
//
//  Created by Rodriguez Isaac on 8/11/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var texto: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
//        texto.translatesAutoresizingMaskIntoConstraints = false
//        texto.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        texto.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

