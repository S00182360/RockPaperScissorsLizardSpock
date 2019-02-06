//
//  Sign.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    //TODO: Add further code for Lizard and Spock
    if(sign == 0) {
        return .Rock
    } else if (sign == 1) {
        return .Paper
    } else {
        return .Scisors
    }
}

enum Sign {
    case Rock, Paper, Scisors
//    case Lizard, Spock
    
    var signSymbol: String {
        switch self {
        case .Paper:
            return "🤚"
        case .Rock:
            return "✊"
        case .Scisors:
            return "✌️"
//        case .Lizard:
//            return "🦎"
//        case .Spock:
//            return "🖖"
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
            }
            //TODO: add code for Lizard and Spock
        }
    }
}



