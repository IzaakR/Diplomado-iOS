//
//  Sing.swift
//  RPS
//
//  Created by Isaac on 8/15/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
enum Sing {
  case rock, paper, scissors
  func randomSing () -> Sing {
    let sing = randomChoice.nextInt()
    switch  sing {
    case 0:
      return .rock
    case 1:
      return .paper
    default:
      return .scissors
    }
  }
  
  func gameState (otherSing: Sing) -> GameState {
    debugPrint(self, "  ", otherSing)
    switch self {
    case .rock:
      switch otherSing {
      case .rock:
        return .draw
      case .paper:
        return .lose
      case .scissors:
        return .win
      }
    case .paper:
      switch otherSing {
      case .rock:
        return .win
      case .paper:
        return .draw
      case .scissors:
        return .lose
      }
    case .scissors:
      switch otherSing {
      case .rock:
        return .lose
      case .paper:
        return .win
      case .scissors:
        return .draw
      }
    }
  }
  
}
