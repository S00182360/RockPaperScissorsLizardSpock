//
//  ViewController.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI(state: currentState)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var playerSign = Sign.Paper
    var computerSign = Sign.Paper
    var currentState = GameState.Start
    
    func UpdateUI(state: GameState) {
        switch state {
        case .Start:
            userSign.text = "👾"
            gameStatus.text = state.gameStatus
            playerChoosePaper.setTitle("🖐", for: UIControl.State.normal)
            playAgain.isHidden = true
            playAgain.isEnabled = false
            playerChooseRock.isEnabled = true
            playerChooseRock.isHidden = false
            playerChoosePaper.isEnabled = true
            playerChooseScissors.isEnabled = true
            playerChooseScissors.isHidden = false
        case .Win, .Loose, .Draw:
            userSign.text = playerSign.signSymbol
            gameStatus.text = state.gameStatus
            playerChoosePaper.setTitle(computerSign.signSymbol, for: UIControl.State.normal)
            playAgain.isHidden = false
            playAgain.isEnabled = true
            playerChooseRock.isEnabled = false
            playerChooseRock.isHidden = true
            playerChoosePaper.isEnabled = false
            playerChooseScissors.isEnabled = false
            playerChooseScissors.isHidden = true

        }
        userSign.text = playerSign.signSymbol
        gameStatus.text = state.gameStatus
        
    }

    
    func play(userSign: Sign) -> GameState {
        computerSign = randomSign()
        return userSign.CompareSign(otherSign: computerSign)
        
    }
    
    @IBOutlet weak var userSign: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playerChoosePaper: UIButton!
    @IBOutlet weak var playerChooseRock: UIButton!
    
    @IBOutlet weak var playerChooseScissors: UIButton!
    
    @IBAction func rockChosen(_ sender: Any) {
        playerSign = .Rock
        currentState = play(userSign: .Rock)
        UpdateUI(state: currentState)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        playerSign = .Paper
        currentState = play(userSign: playerSign)
        UpdateUI(state: currentState)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        playerSign = .Scisors
        currentState = play(userSign: playerSign)
        UpdateUI(state: currentState)
    }
    
    @IBAction func PlayAgainChosen(_ sender: Any) {
        UpdateUI(state: .Start)
    }
    
}

