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
    
    var activePlayer:Int = 1
    var firstPlayer = 1 // Crosses
    var secondPlayer = 2 // Zeros
    
    var ticTacToeGame:TTTBrain = TTTBrain()
    
    @IBOutlet weak var gameInfo: UILabel!
    @IBOutlet weak var playerInfo: UILabel!
    @IBOutlet weak var playerStatusInfo: UILabel!
    
    @IBAction func gameFieldButtonPressed(_ sender: AnyObject) {
        
        // preventing the double clicking on the game field
        if (ticTacToeGame.isTurnAllowed(cellNo: sender.tag-1)) {
            
            ticTacToeGame.markCell(cellNo: sender.tag - 1)
            
            // checking wheather the end of the game
            if (ticTacToeGame.isGameOver()) {
                gameInfo.text = "Game over!"
                gameInfo.textColor = UIColor.red
                playerInfo.text = ""
            }
            else {
                gameInfo.text = ""
            }
            
            /****************************************/
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                playerStatusInfo.text = "Player 2"
                playerStatusInfo.textColor = UIColor.blue
                activePlayer = secondPlayer
                
                if (ticTacToeGame.isGameOver()) {
                    playerStatusInfo.text = "That's all folks!"
                    playerStatusInfo.textColor = UIColor.darkGray
                }

            }
            else if (activePlayer == 2) {
                sender.setImage(UIImage(named: "zero.png"), for: UIControlState())
                playerStatusInfo.text = "Player 1"
                playerStatusInfo.textColor = UIColor.green
                activePlayer = firstPlayer
                
                if (ticTacToeGame.isGameOver()) {
                    playerStatusInfo.text = "That's all folks!"
                    playerStatusInfo.textColor = UIColor.darkGray
                }
            }
        }
        
        else {
            ticTacToeGame.markCell(cellNo: sender.tag - 1)
        }
    }
    
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        ticTacToeGame.restartGame()
        greetPlayers()
        
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
        playerStatusInfo.text = "Player 1"
        playerStatusInfo.textColor = UIColor.green
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

