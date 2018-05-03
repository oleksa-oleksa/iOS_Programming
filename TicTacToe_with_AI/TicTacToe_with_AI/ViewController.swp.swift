//
//  ViewController.swift
//  TicTacToe_Two_Players
//
//  Created by Oleksandra Baga on 02.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//  Free icons made with www.iconfinder.com/editor
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer:Int = 1
    var firstPlayer = 1 // Crosses
    var secondPlayer = 2 // Zeros
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var sum:Int = 0
    var gameOver:Int = 0;
    
    @IBOutlet weak var gameInfo: UILabel!
    @IBOutlet weak var playerInfo: UILabel!
    @IBOutlet weak var playerStatusInfo: UILabel!
    
    @IBAction func gameFieldButtonPressed(_ sender: AnyObject) {
        
        // preventing the double clicking on the game field
        if (gameState[sender.tag-1] == 0) {
            
            gameState[sender.tag-1] = 1 // mark as passed
            sum += 1
            
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
            
            /****************************************/
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                playerStatusInfo.text = "Player 2"
                playerStatusInfo.textColor = UIColor.blue
                activePlayer = secondPlayer
                print(sum)
                
                if (gameOver == 1) {
                    playerStatusInfo.text = "That's all folks!"
                    playerStatusInfo.textColor = UIColor.darkGray
                }

            }
            else if (activePlayer == 2) {
                sender.setImage(UIImage(named: "zero.png"), for: UIControlState())
                playerStatusInfo.text = "Player 1"
                playerStatusInfo.textColor = UIColor.green
                activePlayer = firstPlayer
                print(sum)
                
                if (gameOver == 1) {
                    playerStatusInfo.text = "That's all folks!"
                    playerStatusInfo.textColor = UIColor.darkGray
                }
            }
        }
        
        else {
            gameState[sender.tag-1] = 1
        }
    }
    
    
    @IBAction func restartGame(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        sum = 0
        greetPlayers()
        gameOver = 0
        
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
        sum = gameState.reduce(0, +)
        if (sum == 0) {
            greetPlayers()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

