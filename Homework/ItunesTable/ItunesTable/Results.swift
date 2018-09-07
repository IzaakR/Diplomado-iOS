//
//  Results.swift
//  ItunesTable
//
//  Created by Isaac on 9/7/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import Foundation

struct Results: Codable {
  var resultCount: Int
  var results: [Track]
}
