//
//  ViewController.swift
//  TicTacToe_Two_Players
//
//  Created by Oleksandra Baga on 02.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//  Free icons made with www.iconfinder.com/editor
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // Game starts and Player 1 has current turn
    // The settings for UILabel are set accordingly to Player 1
    var activePlayer:Int = 1
    var humanPlayer = 1 // Crosses
    var computerPlayer = 2 // Zeros
    var winner:Int = 0
    
    var activePlayerName:String = "Player 1"
    var activePlayerSign = "cross.png"
    var gameOverInfo:String = ""
    var winButtons:[Int] = [0, 0, 0]

    var color:UIColor?
    var green:UIColor = UIColor(red: 113.0/255.0, green:
        165.0/255.0, blue: 29.0/255.0, alpha: 1.0)
    var blue:UIColor = UIColor(red: 20.0/255.0, green:
        89.0/255.0, blue: 173.0/255.0, alpha: 1.0)
    var red:UIColor = UIColor(red: 209.0/255.0, green:
        35.0/255.0, blue: 35.0/255.0, alpha: 1.0)
    var ticTacToeGame:TTTBrain = TTTBrain()
    
    @IBOutlet weak var gameInfo: UILabel!
    @IBOutlet weak var playerInfo: UILabel!
    @IBOutlet weak var playerStatusInfo: UILabel!
    
    @IBAction func gameFieldButtonPressed(_ sender: AnyObject) {
        
        // preventing the double clicking on the game field
        if ticTacToeGame.isTurnAllowed(cellNo: sender.tag-1) {
            
            // saving the cellNo where human clicked
            var turnCell:Int = sender.tag-1

            /****************************************/
            // HUMAN TURN
            /****************************************/
            if activePlayer == humanPlayer {
                // Save the turn
                ticTacToeGame.makeTurn(cellNo: turnCell, activePlayer: humanPlayer)
                
                activePlayerSign = "cross.png"
                activePlayerName = "Player 2"
                color = blue
                
                setImageBackground(cellNo: turnCell, activePlayerSign: activePlayerSign)
                designButtons(activePlayerName: activePlayerName, color: color!)
            }
            /****************************************/
            // COMPUTER TURN
            /****************************************/
            
            // set turnCell to a new value - Algorith TTTBrain
            turnCell = ticTacToeGame.computerMakeTurn()
            
            // Save the turn
            self.ticTacToeGame.makeTurn(cellNo: turnCell, activePlayer: self.computerPlayer)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                self.activePlayerSign = "zero.png"
                self.activePlayerName = "Your Turn"
                self.color = self.green
            
                self.setImageBackground(cellNo: turnCell, activePlayerSign: self.activePlayerSign)
                self.designButtons(activePlayerName: self.activePlayerName, color: self.color!)
            
                // set next turn to a human back
                self.activePlayer = self.humanPlayer
            }
            /****************************************/
            // GAME OVER: NO WINNER
            /****************************************/
            if (ticTacToeGame.isGameOver()) {
                activePlayerName = "That's all folks!"
                
                gameOverInfo = "Game Over!"
                color = red
                
                designButtons(activePlayerName: activePlayerName, color: color!)
            }
            
            /****************************************/
            // GAME OVER: SOMEONE WON
            /****************************************/
            (winner, winButtons) = ticTacToeGame.getWinner()
            
            if winner == 1 {
                activePlayerName = "YOU WON!"
                gameOverInfo = "Game Over!"
                color = UIColor(red: 113.0/255.0, green:
                    165.0/255.0, blue: 29.0/255.0, alpha: 1.0)
                
                designButtons(activePlayerName: activePlayerName, color: color!)
            }
            
            if winner == 2 {
                activePlayerName = "COMPUTER WON!"
                gameOverInfo = "Game Over!"
                color = UIColor(red: 209.0/255.0, green:
                    35.0/255.0, blue: 35.0/255.0, alpha: 1.0)
                
                designButtons(activePlayerName: activePlayerName, color: color!)
            }
        }
    }
    
    func setImageBackground(cellNo: Int, activePlayerSign: String) {
        if let tmpButton = self.view.viewWithTag(cellNo + 1) as? UIButton {
            tmpButton.setImage(UIImage(named: activePlayerSign), for: UIControlState())
        }
    }
    
    func designButtons(activePlayerName: String, color: UIColor) {
        playerStatusInfo.text = activePlayerName
        playerStatusInfo.textColor = color
        gameInfo.text = gameOverInfo
        gameInfo.textColor = red
        
        // Designing winning buttons
        let sum = winButtons.reduce(0, +)
        // if winner conbination was set
        if  sum != 0 {
            for i in winButtons {
                if let winButton = self.view.viewWithTag(i + 1) as? UIButton  {
                    
                    if winner == 1 {
                        winButton.setImage(UIImage(named: "cross_won.png"), for: UIControlState())
                    }
                    
                    if winner == 2 {
                        winButton.setImage(UIImage(named: "zeros_won.png"), for: UIControlState())
                    }
                }
            }
        }
    }
    
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        ticTacToeGame.restartGame()
        greetPlayers()
        activePlayer = humanPlayer;
        winner = 0
        winButtons = [0, 0, 0]
        gameOverInfo = ""
        
        for i in 1...9 {
            if let tmpButton = self.view.viewWithTag(i) as? UIButton {
                tmpButton.setImage(nil, for: UIControlState())
            }
        }
    }
    
    func greetPlayers() {
        gameInfo.text = "Game started!"
        gameInfo.textColor = UIColor.blue
        playerInfo.text = "Current turn:"
        playerStatusInfo.text = "Please make a turn!"
        playerStatusInfo.textColor = UIColor(red: 113.0/255.0, green:
            165.0/255.0, blue: 29.0/255.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // game status information
        if (ticTacToeGame.isNewGame()) {
            greetPlayers()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



