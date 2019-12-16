//
//  Checklist.swift
//  Checklists
//
//  Created by Stephanie on 12/12/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
}
