//
//  GameState.swift
//  RPSLS
//
//  Created by Samuel ColvilleRea on 05/02/2019.
//  Copyright © 2019 Samuel ColvilleRea. All rights reserved.
//

import Foundation

enum GameState {
    case Start, Win, Loose, Draw
    
    var gameStatus: String{
        switch self {
        case .Start:
            return "Rock Paper Scissors"
        case .Win:
            return "You Win!\nPlayer Choice:"
        case .Loose:
            return "You Loose!\nPlayer Choice:"
        case .Draw:
            return "Draw!\nPlayer Choice:"
        }
    }
}
