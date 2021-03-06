//
//  MenuItemDetailViewController.swift
//  RestaurantApp
//
//  Created by Isaac on 9/20/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
  var menuItem: MenuItem!
  var delegate: AddToOrderDelegate?
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var addToOrderButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    setupDelegate()
    
    // Do any additional setup after loading the view.
  }
  
  func updateUI(){
    titleLabel.text = menuItem.name
    priceLabel.text = String(format: "$%.2f", menuItem.price)
    descriptionLabel.text = menuItem.description
    addToOrderButton.layer.cornerRadius = 5.0
    
    MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
      guard let image = image else { return }
      DispatchQueue.main.async {
        self.imageView.image = image
      }
    }
  }
  
  func setupDelegate(){
    if let navController = tabBarController?.viewControllers?.last as? UINavigationController,
      let orderTableViewController = navController.viewControllers.first as? OrderTableViewController {
      delegate = orderTableViewController
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func addToOrderButtonTapped(_ sender: Any) {
    UIView.animate(withDuration: 0.3) {
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    delegate?.added(menuItem: menuItem)
  }
  
  
}
