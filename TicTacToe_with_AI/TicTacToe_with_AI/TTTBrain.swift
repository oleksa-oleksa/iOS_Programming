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
    
        gameState[cellNo] = activePlayer
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
        //var foundLine:[Int]?
        //let cornerArray = [[0, 1, 2], [0, 3, 6], [2, 5, 8], [6, 7, 8]]
        //let crossArray = [[0, 4, 8], [2, 4, 6]]
        
        // take center
        if gameState[4] == 0 {
            turnCell = 4
        }
        
        // if center is already taken by AI - take a corner on the line that is not occupied by a human
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
        
        // if we have 2 computer turns on one of the diagonals: AI can win, it wins
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
            
            // has already 2 computer turns
            if gameState[2] != 1 && gameState[6] != 1 {
                if gameState[2] == 2 {
                    turnCell = 6
                }
                else if gameState[6] == 2 {
                    turnCell = 2
                }
            }
        }
        
        // if center is already taken by AI - but cornes were taken by human: Block Human
        if turnCell == nil && gameState[4] == 2 {
            // left vertical line has two human turn: block human
            if gameState[0] == 1 && gameState[6] == 1 {
                if gameState[3] != 2 {
                    turnCell = 3
                }
                else {
                    if gameState[5] == 0 {
                    turnCell = 5
                    }
                }
            }
            // right vertical line has two human turn: block human
            if gameState[2] == 1 && gameState[8] == 1 {
                if gameState[5] != 2 {
                    turnCell = 5
                }
                else {
                    if gameState[3] == 0 {
                    turnCell = 3
                    }
                }
            }
            
            // top horisontal line has two human turn: block human
            if gameState[0] == 1 && gameState[2] == 1 {
                if gameState[1] != 2 {
                    turnCell = 1
                }
                else {
                    if gameState[7] == 0 {
                    turnCell = 7
                    }
                }
            }
            
            // bottom horisontal line has two human turn: block human
            if gameState[6] == 1 && gameState[8] == 1 {
                if gameState[7] != 2 {
                    turnCell = 7
                }
                else {
                    if gameState[1] == 0 {
                    turnCell = 1
                    }
                }
            }
        }
        
        // if center is occupied by human: take a free corner and check possibility to block human
        /* if turnCell == nil && gameState[4] == 2 {
            var foundTaken:Bool = false
            
            // find the line with a cross to block
            for combination in cornerArray {
                if gameState[combination[0]] == 1 || gameState[combination[1]] == 1 || gameState[combination[2]] == 1 {
                    foundTaken = true
                    foundLine = combination
                }
            }
            
            if foundTaken == true {
                turnCell = blockRandomly(lineCombination: foundLine!)
            }
            
            // human just took center and the rest is free
            if foundTaken == false {
                repeat {
                    let randomIndex = Int(arc4random_uniform(UInt32(cornerArray.count)))
                    let randomLine = cornerArray[randomIndex]
                    turnCell = blockRandomly(lineCombination: randomLine)
                    
                    if gameState[turnCell!] != 0 {
                        turnCell = nil
                    }
                } while (turnCell == nil)
            }
        } */
        return turnCell! // for button tag
    }
    
    func blockRandomly(lineCombination: [Int]) -> Int{
    
        var turnCell:Int?
    
        repeat {
            let randomIndex = Int(arc4random_uniform(UInt32(lineCombination.count)))
            turnCell = randomIndex
            
            if gameState[turnCell!] != 0 {
                turnCell = nil
            }
        } while (turnCell == nil)
        
        return turnCell!
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
