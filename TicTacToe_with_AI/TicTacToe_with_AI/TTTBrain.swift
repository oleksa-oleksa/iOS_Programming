//
//  TTTBrain.swift
//  TicTacToe_with_AI
//
//  Created by Oleksandra Baga on 03.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import Foundation
import UIKit

class TTTBrain {
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    func isTurnAllowed(cellNo: Int) -> Bool {
        if (gameState[cellNo]) == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func markCell(cellNo: Int) {
        gameState[cellNo] = 1
    }
    
    func isGameOver() -> Bool {
        let sum = gameState.reduce(0, +)
        
        if (sum > 8) {
            return true
        }
        else {
            return false
        }
    }
    
    func restartGame() {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    func isNewGame() -> Bool {
        let sum = gameState.reduce(0, +)
        
        if (sum == 0) {
            return true
        }
        else {
            return false
        }
    }
}
