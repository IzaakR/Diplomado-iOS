//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Isaac on 9/7/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit
@objc protocol ToDoCellDelegate: class {
  func checkmarkTapped(sender: ToDoCell)
}
class ToDoCell: UITableViewCell  {
  var delegate: ToDoCellDelegate?
  @IBOutlet weak var isCompleteButton: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  @IBAction func completeButtonTapped() {
    delegate?.checkmarkTapped(sender: self)
  }
}
