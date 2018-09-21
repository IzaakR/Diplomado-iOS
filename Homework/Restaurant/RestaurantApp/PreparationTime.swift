//
//  PreparationTime.swift
//  RestaurantApp
//
//  Created by Rodriguez Isaac on 9/7/18.
//  Copyright © 2018 RodriguezIsaac. All rights reserved.
//

import Foundation
struct PreparationTime: Codable {
    let prepTime: Int
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
