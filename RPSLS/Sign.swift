//
//  Sign.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import Foundation

enum Sign {
    case Rock, Paper, Scisors
    
    var signSymbol: String {
        switch self {
        case .Paper:
            return "🤚"
        case .Rock:
            return "✊"
        case .Scisors:
            return "✌️"
        }
    }
    
    func CompareSign(otherSign: Sign) -> GameState {
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
        case .Rock:
            switch otherSign {
            case .Paper:
                return .Loose
            case .Rock:
                return .Draw
            case .Scisors:
                return .Win
            }
        case .Scisors:
            switch otherSign {
            case .Paper:
                return .Win
            case .Rock:
                return .Loose
            case .Scisors:
                return .Draw
            }

        }
    }
}



