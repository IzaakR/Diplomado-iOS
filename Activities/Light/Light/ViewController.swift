//
//  ViewController.swift
//  Light
//
//  Created by Rodriguez Isaac on 8/17/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView() {
        view.backgroundColor = UIColor.black
    }

    @IBAction func lightAction(_ sender: UIButton) {
       optionSelected(option: sender.tag)
    }
    
    func optionSelected(option: Int) {
        switch option {
        case 0:
            stopTimer()
            self.view.backgroundColor = UIColor.white
        case 1:
            stopTimer()
            modeFlash()
        default:
            break
        }
    }
    
    func modeFlash() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeColorViewWhite), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(changeColorViewBlack), userInfo: nil, repeats: true)
    }
    
    @objc func changeColorViewWhite() {
         view.backgroundColor = UIColor.white
    }
    @objc func changeColorViewBlack() {
        view.backgroundColor = UIColor.black
    }
    
    func stopTimer() {
        timer.invalidate()
        timer.fire()
    }
}

