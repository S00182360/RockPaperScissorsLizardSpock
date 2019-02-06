//
//  Sign.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 4)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    //TODO: Add further code for Lizard and Spock
    if(sign == 0) {
        return .Rock
    } else if (sign == 1) {
        return .Paper
    } else if (sign == 2) {
        return .Scisors
    } else if (sign == 3) {
        return .Lizard
    } else {
        return .Spock
    }
}

enum Sign {
    case Rock, Paper, Scisors, Lizard, Spock
    
    var signSymbol: String {
        switch self {
        case .Paper:
            return "🖐"
        case .Rock:
            return "✊"
        case .Scisors:
            return "✌️"
        case .Lizard:
            return "🦎"
        case .Spock:
            return "🖖"
        }
    }
    
    func CompareSign(otherSign: Sign) -> GameState {
        //TODO: Add additional cases for Lizard and Spock
        //and to internal switches
        switch self {
//            case for paper
        case .Paper:
            switch otherSign {
            case .Paper:
                return .Draw //player draws
            case .Rock:
                return .Win //player wins
            case .Scisors:
                return .Loose //player looses
            case .Lizard:
                return .Loose
            case .Spock:
                return .Win
            }
        //case for rock
        case .Rock:
            switch otherSign {
            case .Paper:
                return .Loose
            case .Rock:
                return .Draw
            case .Scisors:
                return .Win
            case .Lizard:
                return .Win
            case .Spock:
                return .Loose
            }
        //case for scissors
        case .Scisors:
            switch otherSign {
            case .Paper:
                return .Win
            case .Rock:
                return .Loose
            case .Scisors:
                return .Draw
            case .Lizard:
                return .Win
            case .Spock:
                return .Loose
            }
        case .Lizard:
            switch otherSign {
            case .Paper:
                return .Win //Lizard eats Paper
            case .Rock:
                return .Loose //Rock crushes lizard
            case .Scisors:
                return .Loose //Scissors decapitate lizard
            case .Lizard:
                return .Draw //Draw
            case .Spock:
                return .Win //Lizard poisons Spock
            }
        case .Spock:
            switch otherSign {
            case .Paper:
                return .Loose //Paper disproves Spock
            case .Rock:
                return .Win //Spock destroys Rock
            case .Scisors:
                return .Win //Spock Vaporises Scissons
            case .Lizard:
                return .Loose //Lizard Poisons Spock
            case .Spock:
                return .Draw //Draw
            }
            
        }
    }
}



