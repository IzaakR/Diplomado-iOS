//
//  MenuTableViewController.swift
//  RestaurantApp
//
//  Created by Rodriguez Isaac on 9/7/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
  let menuController = MenuController()
  var menuItems = [MenuItem]()
  var category: String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      title = category.capitalized
      menuController.fetchMenuItems(categoryName: category)
        { (menuItems) in
        if let menuItems = menuItems {
        self.updateUI(with: menuItems)
        }
      }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func updateUI(with menuItems: [MenuItem]) {
    DispatchQueue.main.async {
      self.menuItems = menuItems
      self.tableView.reloadData()
    }
  }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier:"MenuCellIdentifier", for: indexPath)
      configure(cell: cell, forItemAt: indexPath)
      return cell
    }
  
  func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
    let menuItem = menuItems[indexPath.row]
    cell.textLabel?.text = menuItem.name
    cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
  }

}
