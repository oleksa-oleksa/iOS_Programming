//
//  TTTBrain.swift
//  TicTacToe_with_AI
//
//  Created by Oleksandra Baga on 03.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import Foundation

class TTTBrain {
    
    var activePlayer:Int = 1
    var firstPlayer = 1 // Crosses
    var secondPlayer = 2 // Zeros
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var sum:Int = 0
    var gameOver:Int = 0;
    
    func checkGameOver(sumOfTurns: Int) {
        // checking wheather the end of the game
        if (sum > 8) {
            gameInfo.text = "Game over!"
            gameInfo.textColor = UIColor.red
            playerInfo.text = ""
            gameOver = 1
        }
        else {
            gameInfo.text = ""
        }
    }
}
