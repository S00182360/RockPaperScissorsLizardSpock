//
//  ViewController.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var playerSign = Sign.Paper
    var computerSign = Sign.Paper
    var currentState = GameState.Start
    let gameChar = "👾"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI(state: currentState)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    func UpdateUI(state: GameState) {
        
        switch state {
            
        case .Start:
            self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 1.0)
            initialiseIcons(state: state)
            
        case .Draw:
            self.view.backgroundColor = UIColor(hue: 0.1361, saturation: 1, brightness: 1, alpha: 1.0)
            setIconView(state: state, sign: playerSign)
            
        case .Loose:
            self.view.backgroundColor = UIColor(hue: 0.0333, saturation: 1, brightness: 0.98, alpha: 1.0)
            setIconView(state: state, sign: playerSign)
            
        case .Win:
            self.view.backgroundColor = UIColor(hue: 0.4028, saturation: 1, brightness: 0.77, alpha: 1.0)
            setIconView(state: state, sign: playerSign)
        }

        
    }

    
    func play(userSign: Sign) -> GameState {
        computerSign = randomSign()
        return userSign.CompareSign(otherSign: computerSign)
        
    }
    
    func setIconView(state: GameState, sign: Sign) {
        userSign.text = computerSign.signSymbol
        gameStatus.text = state.gameStatus
        lizardSpock.isHidden = true
        playerChoiceUpdate.isHidden = false
        playerChoiceUpdate.text = sign.signSymbol
        plyrLabel.isHidden = false
        compLabel.isHidden = false
        
        playAgain.isHidden = false
        playAgain.isEnabled = true
        
        playerChoseRock.isEnabled = false
        playerChoseRock.isHidden = true
        playerChosePaper.isEnabled = false
        playerChosePaper.isHidden = true
        playerChoseScissors.isEnabled = false
        playerChoseScissors.isHidden = true
        playerChoseSpock.isHidden = true
        playerChoseSpock.isEnabled = false
        playerChoseLizard.isHidden = true
        playerChoseLizard.isEnabled = false
    }
    
    func initialiseIcons(state: GameState) {
        userSign.text = ""
        userSign.text = gameChar
        gameStatus.text = state.gameStatus
        playerChoiceUpdate.isHidden = true
        plyrLabel.isHidden = true
        compLabel.isHidden = true
        
        playerChoseRock.isHidden = false
        playerChosePaper.isHidden = false
        playerChoseScissors.isHidden = false
        playerChoseLizard.isHidden = false
        playerChoseSpock.isHidden = false
        
        playerChoseRock.isEnabled = true
        playerChosePaper.isEnabled = true
        playerChoseScissors.isEnabled = true
        playerChoseLizard.isEnabled = true
        playerChoseSpock.isEnabled = true
        
        playAgain.isHidden = true
        playAgain.isEnabled = false
        
        gameStatus.text = state.gameStatus
        lizardSpock.isHidden = false
    }
    
    @IBOutlet weak var compLabel: UILabel!
    @IBOutlet weak var plyrLabel: UILabel!
    @IBOutlet weak var playerChoiceUpdate: UILabel!
    @IBOutlet weak var userSign: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var lizardSpock: UILabel!
    
    @IBOutlet weak var playerChosePaper: UIButton!
    @IBOutlet weak var playerChoseRock: UIButton!
    @IBOutlet weak var playerChoseScissors: UIButton!
    @IBOutlet weak var playerChoseSpock: UIButton!
    @IBOutlet weak var playerChoseLizard: UIButton!
    

    
    //Selection functions
    @IBAction func lizardChosen(_ sender: Any) {
        playerSign = .Lizard
        currentState = play(userSign: .Lizard)
        UpdateUI(state: currentState)
    }
    
    
    @IBAction func spockChosen(_ sender: Any) {
        playerSign = .Spock
        currentState = play(userSign: .Spock)
        UpdateUI(state: currentState)
    }
    
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
        playerSign = .Paper
        currentState = .Start
        UpdateUI(state: currentState)
    }
    
}

