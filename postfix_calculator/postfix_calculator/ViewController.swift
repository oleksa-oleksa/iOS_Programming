//
//  ViewController.swift
//  postfix_calculator
//
//  Created by Oleksandra Baga on 12.04.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//  For Beuth Hochschule für Technik. iOS Programming Course 7 Semester

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var numberOnScreen:Int?;
    var numberPrevious:Int?;
    var isMathPerforming = false;
    var isWaitingNext = false;
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        // hides Enter button after the button was pressed once
        // If Enter pressed - we have to save the first number.
        // The case only relevant for the first digit
        if sender.tag == 16 && numberOnScreen != nil && label.text != "" {
            sender.alpha = 0.75
            sender.isEnabled = false
            
            numberPrevious = numberOnScreen
            numberOnScreen = 0
            label.text = "" // clears the screen from the previous number
            isMathPerforming = true // waiting for the second number
        }
        else {
            // zero value will be start value for the calculations
            sender.alpha = 0.75
            sender.isEnabled = false
            
            numberPrevious = 0
            numberOnScreen = 0
            label.text = "" // clears the screen from the previous number
            isMathPerforming = true // waiting for the second number
        }
    }
    
    @IBAction func controlButtons(_ sender: UIButton){
        
        // no mathematical operation if no number where given
        // skipping the "C", "Del" and "Equal" buttons
        if isMathPerforming == true && label.text != "" && sender.tag != 11 && sender.tag != 111 && sender.tag != 16 {
            numberOnScreen = Int(label.text!)!
            isWaitingNext = true;
            
            // Division
            if sender.tag == 12  && numberOnScreen != 0 {
                numberPrevious = numberPrevious! / numberOnScreen!
                label.text = String(numberPrevious!)
            }
                
            else if sender.tag == 12 && numberOnScreen == 0 {
                label.text = String(0)
            }
            
            // Multiplication
            else if sender.tag == 13 {
                numberPrevious = numberPrevious! * numberOnScreen!
                label.text = String(numberPrevious!)
            }
            
            // Substraction
            else if sender.tag == 14 {
                numberPrevious = numberPrevious! - numberOnScreen!
                label.text = String(numberPrevious!)
            }
            
            // Addition
            else if sender.tag == 15 {
                numberPrevious = numberPrevious! + numberOnScreen!
                label.text = String(numberPrevious!)
            }
        }
            
        // "C" = Delete all
        if sender.tag == 11 {
            numberPrevious = 0
            numberOnScreen = 0
            label.text = ""
            
            if let equalButton = self.view.viewWithTag(16) as? UIButton{
                equalButton.isEnabled = true
                equalButton.alpha = 1.0
            }
        }
        
        // "Del" = Delete the last digit of the numberOnScreen
        if sender.tag == 111 {
            numberOnScreen = Int(label.text!)
            numberOnScreen = numberOnScreen! / 10
            label.text = String(numberOnScreen!)
        }
    }
    
    @IBAction func buttonPushed(_ sender: UIButton) {
    
        if isWaitingNext == true && numberPrevious != nil {
            label.text = String(sender.tag - 1)
            numberOnScreen = Int(label.text!)!
            isWaitingNext = false
        }
        
        else {
            // omits the nmore than one zero at the begin of the number
            if sender.tag == 1 && numberOnScreen == 0 {
                label.text = String(sender.tag - 1)
            }
            else if sender.tag != 1 && numberOnScreen == 0 {
                label.text = String(sender.tag - 1)
            }
            else {
                label.text = label.text! + String(sender.tag - 1)
            }
            numberOnScreen = Int(label.text!)!
        }

        //debug information
        print(sender.currentTitle!)
        print(sender.tag)
    }
    
}

