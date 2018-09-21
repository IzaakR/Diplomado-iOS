//
//  OrderConfirmationViewController.swift
//  RestaurantApp
//
//  Created by Isaac on 9/20/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
  @IBOutlet weak var timeRemainingLabel: UILabel!
  var minutes: Int!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    timeRemainingLabel.text = "Thank you for your order! Your wait time is aproximately \(minutes!) minutes."
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
