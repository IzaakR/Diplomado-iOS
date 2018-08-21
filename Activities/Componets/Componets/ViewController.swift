//
//  ViewController.swift
//  Componets
//
//  Created by Rodriguez Isaac on 8/18/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewSlider()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func initViewSlider() {
        if slider.value == 0.5 {
          photoImageView.image = UIImage(named: "bg3")
        }
    }
    @IBAction func chageValue(_ sender: UISlider) {
        switch slider.value {
        case 0:
            photoImageView.image = UIImage(named: "bg1")
        case 1:
            photoImageView.image = UIImage(named: "bg2")
        default:
            photoImageView.image = UIImage(named: "bg3")
        }
    }
    
}

