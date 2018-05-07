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
    
    // for keeping the turns and preventing the double turn/click
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameEnded:Bool = false
    
    /* Let is an immutable variable, meaning that it cannot be changed, other languages call this a constant. In C++ it you can define it as const. */
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                               [0, 3, 6], [1, 4, 7], [2, 5, 8],
                               [0, 4, 8], [2, 4, 6]]

    func isTurnAllowed(cellNo: Int) -> Bool {
        if (gameState[cellNo]) == 0 && gameEnded != true {
            return true
        }
        else {
            return false
        }
    }
    
    func makeTurn(cellNo: Int, activePlayer: Int) -> Int {
        // saving the player's turn
        gameState[cellNo] = activePlayer
        
        var newActivePlayer:Int?
        
        if (activePlayer == 1) {
            newActivePlayer = 2
        }
            
        else if (activePlayer == 2) {
            newActivePlayer = 1
        }

        return newActivePlayer!
    }
    
    func isGameOver() -> Bool {
        // Player 1 has 5 turns marked with 1 ==> sum is 5 when player 1 has finished
        // Player 2 has 4 turns marked with 2 ==> sum is 8 when player 2 has finished
        // Total sum = 13 when gameis over
        
        let sum = gameState.reduce(0, +)
        
        if (sum > 12) {
            return true
        }
        else {
            return false
        }
    }
    
    func getWinner() -> (Int, [Int]) {
        var winner:Int = 0
        var winButtons:[Int] = [0, 0, 0]
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                winner = gameState[combination[0]]
                winButtons = combination
                gameEnded = true
            }
        }
        
        return (winner, winButtons)
    }
    
    
    func restartGame() {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameEnded = false
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
