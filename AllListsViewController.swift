//
//  AllListsViewControllerTableViewController.swift
//  Checklists
//
//  Created by Stephanie on 12/12/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class AllListsViewControllerTableViewController: UITableViewController {

  let cellIdentifier = "ChecklistCell"
  var lists = [Checklist]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //to register the cell identifier with the underlying table view so that the table view knows which cell class should be used to create a new table view cell instance when a dequeue request comes in with that cell identifier
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
      navigationController?.navigationBar.prefersLargeTitles = true
      

      var list = Checklist(name: "Birthdays")
      lists.append(list)
      
      list = Checklist(name: "Groceries")
      lists.append(list)
      
      list = Checklist(name: "Cool Apps")
      lists.append(list)
      
      list = Checklist(name: "To Do")
      lists.append(list)
  }
  // MARK:- Navigation
  override func prepare(for segue: UIStoryboardSegue,
                           sender: Any?) {
  if segue.identifier == "ShowChecklist" { let controller = segue.destination as! ChecklistViewController
    controller.checklist = sender as? Checklist
  }
}
  // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

      return lists.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = "List \(indexPath.row)"
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
  
  //Since the table view for All Lists isnt' using prototype cells, can't perform segue thru IB so need to be done manually
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "ShowChecklist", sender: nil)
  }
}
