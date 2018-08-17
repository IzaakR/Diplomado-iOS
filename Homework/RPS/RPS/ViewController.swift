//
//  ViewController.swift
//  RPS
//
//  Created by Isaac on 8/15/18.
//  Copyright © 2018 Mudpie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var buttonRock: UIButton!
  @IBOutlet weak var buttonPaper: UIButton!
  @IBOutlet weak var buttonScissors: UIButton!
  @IBOutlet weak var stkIcon: UIStackView!
  @IBOutlet weak var stkWon: UIStackView!
  @IBOutlet weak var labelGame: UILabel!
  @IBOutlet weak var stkPlay: UIStackView!
  @IBOutlet weak var stkGameOption: UIStackView!
  @IBOutlet weak var labelGameState: UILabel!
  @IBOutlet weak var labelImageGameState: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    initViewRPS()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func initViewRPS() {
    stkWon.isHidden = true
    stkPlay.isHidden = true
    view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
  }

  @IBAction func actionState(_ sender: UIButton) {
    actionRps(optionSing: sender.tag)
  }
  
  @IBAction func actionPlayGame(_ sender: UIButton) {
    gameStateAction(state: .start)
  }
  
  func actionRps(optionSing: Int) {
    switch optionSing {
    case 0:
      let sing = Sing.rock
      let gameState = sing.gameState(otherSing: sing.randomSing())
      gameStateAction(state: gameState)
    case 1:
      let sing = Sing.paper
      let gameState = sing.gameState(otherSing: sing.randomSing())
      gameStateAction(state: gameState)
    default:
      let sing = Sing.scissors
      let gameState = sing.gameState(otherSing: sing.randomSing())
      gameStateAction(state: gameState)
    }
  }
  
  
  
  func gameStateAction(state: GameState) {
    switch state {
    case .draw:
      view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
      stkIcon.isHidden = true
      stkGameOption.isHidden = true
      stkPlay.isHidden = false
      stkWon.isHidden = false
      labelGame.isHidden = true
      labelGameState.text = "Draw!"
      labelImageGameState.text = "🤙"
    case .lose:
      view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
      stkIcon.isHidden = true
      stkGameOption.isHidden = true
      stkPlay.isHidden = false
      stkWon.isHidden = false
      labelGame.isHidden = true
      labelGameState.text = "Lose!"
      labelImageGameState.text = "👎"
    case .win:
      view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      stkIcon.isHidden = true
      stkGameOption.isHidden = true
      stkPlay.isHidden = false
      stkWon.isHidden = false
      labelGame.isHidden = true
      labelGameState.text = "You Won!"
      labelImageGameState.text = "💪"
    case .start:
      view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
      stkIcon.isHidden = false
      stkGameOption.isHidden = false
      stkPlay.isHidden = true
      stkWon.isHidden = true
      labelGame.isHidden = false
    }
    
  }
  
}

