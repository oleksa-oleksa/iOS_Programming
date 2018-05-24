//
//  TTTBrain.swift
//  TicTacToe_with_AI
//
//  Created by Oleksandra Baga on 03.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
// AI created by Oleksandra Baga on 08.05.2018
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
    
    func makeTurn(cellNo: Int, activePlayer: Int) {
    
        if gameEnded == false {
            gameState[cellNo] = activePlayer
        }
    }
    
    func computerMakeTurn() -> Int {
        /* Algorithm:
         1. If AI can win, it wins
         2. AI blocks your winning combinations
         3. AI tries to create a winning combination
         
         a1. If center is not occupied - take it
         a2. if center is yours - 1. block human 2. take a free corner to create
         
         b1. if center is occupaed - take corner
         b2. 1. block human 2. make winning combination
         */
        
        var turnCell:Int?
        
        /********************************************************************
        //  a1. If center is not occupied - take it
         ********************************************************************/

        if gameState[4] == 0 {
            turnCell = 4
        }
        
        /********************************************************************
         // if we have 2 computer turns on one of the lines: AI can win, it wins
         ********************************************************************/
        
        if turnCell == nil && gameState[4] == 2 {
            // first diagonal has already 2 computer turns
            if gameState[0] != 1 && gameState[8] != 1 {
                if gameState[0] == 2 {
                    turnCell = 8
                }
                else if gameState[8] == 2 {
                    turnCell = 0
                }
            }
            
            // second diagonal has already 2 computer turns
            if gameState[2] != 1 && gameState[6] != 1 {
                if gameState[2] == 2 {
                    turnCell = 6
                }
                else if gameState[6] == 2 {
                    turnCell = 2
                }
            }
            
            // vertical diagonal has already 2 computer turns
            if gameState[1] != 1 && gameState[7] != 1 {
                if gameState[1] == 2 {
                    turnCell = 7
                }
                else if gameState[7] == 2 {
                    turnCell = 1
                }
            }
            
            // horizontal has already 2 computer turns
            if gameState[3] != 1 && gameState[5] != 1 {
                if gameState[3] == 2 {
                    turnCell = 5
                }
                else if gameState[5] == 2 {
                    turnCell = 3
                }
            }
        }
        
        /********************************************************************
        // if center and one corner already taken by Human
        // 2. try to block human
        ********************************************************************/
        
        if turnCell == nil && gameState[4] == 1 {
            // Blocks the human winning combination:
            // first diagonal should be blocked by AI
            if gameState[0] == 1 && gameState[8] == 0 {
                turnCell = 8
            }
                
            else if gameState[0] == 0 && gameState[8] == 1 {
                turnCell = 0
            }
            
            // second diagonal should be blocked by AI
            if gameState[2] == 1 && gameState[6] == 0 {
                turnCell = 6
            }
                
            else if gameState[2] == 0 && gameState[6] == 1 {
                turnCell = 2
            }
            
        }
        
        /********************************************************************
         // if center is already taken by Human and a winning combination of human
         // is going to be on vertical or horisonal line: block human
         ********************************************************************/
        
        if turnCell == nil && gameState[4] == 1 {
            // Blocks the human winning combination:
            // first diagonal should be blocked by AI
            
            if gameState[3] == 1 && gameState[5] == 0 {
                turnCell = 5
            }
                
            else if gameState[3] == 0 && gameState[5] == 1 {
                turnCell = 3
            }
            
            // second diagonal is free for AI
            if gameState[1] == 1 && gameState[7] == 0 {
                turnCell = 7
            }
                
            else if gameState[1] == 0 && gameState[7] == 1 {
                turnCell = 1
            }
        }
        
        /********************************************************************
         // both corners are still free and human turn is in the center
         // just make turn on the corner
         ********************************************************************/
        if turnCell == nil && gameState[4] == 1 {
            var combinations:Array<Int> = []

            if gameState[0] == 0 && gameState[8] == 0 {
                combinations.append(0)
                combinations.append(8)
            }
            
            if gameState[2] == 0 && gameState[6] == 0 {
                combinations.append(2)
                combinations.append(6)
            }
            
            // FEATURE: make random choise if mire than one if worked
            // it will omit the situation when human can recognize the pattern and find out which case is the last
            let randomIndex = Int(arc4random_uniform(UInt32(combinations.count)))
            turnCell = combinations[randomIndex]
        }
        
        // both sides are still free, just make turn on the corner
        if turnCell == nil && gameState[4] == 1 {
            var combinations:Array<Int> = []

            if gameState[3] == 0 && gameState[5] == 0 {
                combinations.append(3)
            }
            
            if gameState[1] == 0 && gameState[7] == 0 {
                combinations.append(7)
            }
            
            let randomIndex = Int(arc4random_uniform(UInt32(combinations.count)))
            turnCell = combinations[randomIndex]
        }
        
        
        
        
        /********************************************************************
         // if we have 2 human turns on one of the lines: block human
         ********************************************************************/
        
        if turnCell == nil && gameState[4] == 1 {
            // first diagonal has already 2 computer turns
            if gameState[1] != 1 && gameState[7] != 1 {
                if gameState[1] == 2 {
                    turnCell = 7
                }
                else if gameState[7] == 2 {
                    turnCell = 1
                }
            }
            
            // has already 2 computer turns
            if gameState[3] != 1 && gameState[5] != 1 {
                if gameState[3] == 2 {
                    turnCell = 5
                }
                else if gameState[5] == 2 {
                    turnCell = 3
                }
            }
        }
        
        /********************************************************************
         // human turn is on one of the lines in the middle: try to find free cell
         ********************************************************************/
        if turnCell == nil && gameState[4] == 2 {

            if gameState[1] == 1 && gameState[0] == 0 && gameState[2] == 0 {
                turnCell = 0
            }
            
            if gameState[5] == 1 && gameState[2] == 0 && gameState[8] == 0 {
                turnCell = 2
            }
            
            if gameState[7] == 1 && gameState[6] == 0 && gameState[8] == 0 {
                turnCell = 8
            }
            
            if gameState[3] == 1 && gameState[0] == 0 && gameState[6] == 0 {
                turnCell = 6
            }
        }
        
        /********************************************************************
        // if center is already taken by AI
        // Important: but cornes were taken by human: Block Human
        ********************************************************************/

        if turnCell == nil && gameState[4] == 2 {
            // left vertical line has two human turn: block human
            if gameState[0] == 1 && gameState[6] == 1 {
                if gameState[3] == 0 {
                    turnCell = 3
                }
                else {
                    if gameState[5] == 0 {
                        turnCell = 5
                    }
                }
            }
            
            if gameState[0] == 1 && gameState[3] == 1 {
                if gameState[6] == 0 {
                    turnCell = 6
                }
                else {
                    if gameState[5] == 0 {
                        turnCell = 5
                    }
                }
            }
            
            if gameState[6] == 1 && gameState[3] == 1 {
                if gameState[0] == 0 {
                    turnCell = 0
                }
                else {
                    if gameState[5] == 0 {
                        turnCell = 5
                    }
                }
            }
            
            
            // right vertical line has two human turn: block human
            if gameState[2] == 1 && gameState[8] == 1 {
                if gameState[5] == 0 {
                    turnCell = 5
                }
                else {
                    if gameState[3] == 0 {
                        turnCell = 3
                    }
                }
            }
            
            if gameState[2] == 1 && gameState[5] == 1 {
                if gameState[8] == 0 {
                    turnCell = 8
                }
                else {
                    if gameState[3] == 0 {
                        turnCell = 3
                    }
                }
            }
            
            if gameState[8] == 1 && gameState[5] == 1 {
                if gameState[2] == 0 {
                    turnCell = 2
                }
                else {
                    if gameState[3] == 0 {
                        turnCell = 3
                    }
                }
            }
            
            // top horisontal line has two human turn: block human
            if gameState[0] == 1 && gameState[2] == 1 {
                if gameState[1] == 0 {
                    turnCell = 1
                }
                else {
                    if gameState[7] == 0 {
                        turnCell = 7
                    }
                }
            }
            
            if gameState[0] == 1 && gameState[1] == 1 {
                if gameState[2] == 0 {
                    turnCell = 2
                }
                else {
                    if gameState[7] == 0 {
                        turnCell = 7
                    }
                }
            }
            
            if gameState[1] == 1 && gameState[2] == 1 {
                if gameState[0] == 0 {
                    turnCell = 0
                }
                else {
                    if gameState[7] == 0 {
                        turnCell = 7
                    }
                }
            }
            
            // bottom horisontal line has two human turn: block human
            if gameState[6] == 1 && gameState[8] == 1 {
                if gameState[7] == 0 {
                    turnCell = 7
                }
                else {
                    if gameState[1] == 0 {
                        turnCell = 1
                    }
                }
            }
            
            if gameState[6] == 1 && gameState[7] == 1 {
                if gameState[8] == 0 {
                    turnCell = 8
                }
                else {
                    if gameState[1] == 0 {
                        turnCell = 1
                    }
                }
            }
            
            if gameState[7] == 1 && gameState[8] == 1 {
                if gameState[6] == 0 {
                    turnCell = 6
                }
                else {
                    if gameState[1] == 0 {
                        turnCell = 1
                    }
                }
            }
        }
        
        /********************************************************************
        // if center is already taken by AI but cornes are still free -
        // take a corner on the line that is not occupied by a human
         ********************************************************************/

        if turnCell == nil && gameState[4] == 2 {
            // first diagonal is free for AI
            if gameState[0] != 1 && gameState[8] != 1 {
                if gameState[0] == 0 {
                    turnCell = 0
                }
                else if gameState[8] == 0 {
                    turnCell = 8
                }
            }
                
            // second diagonal is free for AI
            if gameState[2] != 1 && gameState[6] != 1 {
                if gameState[2] == 0 {
                    turnCell = 2
                }
                else if gameState[6] == 0 {
                    turnCell = 6
                }
            }
        }
        
        /********************************************************************
         // Minor situation that leads to draw: nobody wins
         ********************************************************************/
        
        if turnCell == nil && gameState[4] == 2 {
            
            if gameState[0] != 0 && gameState[2] != 0 {
                if gameState[0] != gameState[2] {
                    turnCell = 1
                }
            }
            
            if gameState[2] != 0 && gameState[8] != 0 {
                if gameState[2] != gameState[8] {
                    turnCell = 5
                }
            }
            
            if gameState[6] != 0 && gameState[8] != 0 {
                if gameState[6] != gameState[8] {
                    turnCell = 7
                }
            }
            
            if gameState[0] != 0 && gameState[6] != 0 {
                if gameState[0] != gameState[6] {
                    turnCell = 3
                }
            }
        }
        
        if turnCell == nil {
            turnCell = gameState.index(of: 0)
            
        }
        
        return turnCell! // for button tag
    }
    
    
    func isGameOver() -> Bool {
        // Player 1 has 5 turns marked with 1 ==> sum is 5 when player 1 has finished
        // Player 2 has 4 turns marked with 2 ==> sum is 8 when player 2 has finished
        // Total sum = 13 when game is over
        
        let sum = gameState.reduce(0, +)
        
        if (sum > 12) {
            gameEnded = true;
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
