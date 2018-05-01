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
    
  

    var numberOnScreen:Int?
    var numberPrevious:Int?
    var isMathPerforming = false
    var isWaitingNext = false
    var lastOperations:[String] = []
    var numberOfOperations:Int = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var showLastOperations: UILabel!
    @IBOutlet weak var showSign: UILabel!
    
    func addOperation(operation: String, operand: Int) {
        // adding the next element to the list of last 10 operations
        lastOperations.append(operation)
        lastOperations.append(String(operand))
        let joiner = " "
        let joinedString = lastOperations.joined(separator: joiner)
        showLastOperations.text = joinedString
    }
    
    func modifyList() {
        if numberOfOperations > 10 {
            lastOperations.removeFirst()
            lastOperations.removeFirst()
        }
    }
    
    func checkSign(result: Int) {
        if result < 0 {
            showSign.text = "-"
        }
        else {
            showSign.text = "+"
        }
    }
    
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
            
            // adding the first element to the list of last 10 operations
            lastOperations.append(String(numberPrevious!))
            showLastOperations.text = lastOperations[0]
            numberOfOperations = 1; // init the counter with first operation
            isMathPerforming = true // waiting for the second number
        }
        else {
            // zero value will be start value for the calculations
            sender.alpha = 0.75
            sender.isEnabled = false
            
            numberPrevious = 0
            numberOnScreen = 0
            label.text = "" // clears the screen from the previous number
            
            // adding the first element to the list of last 10 operations
            lastOperations.append(String(numberPrevious!))
            showLastOperations.text = lastOperations[0]
            numberOfOperations = 1;
            isMathPerforming = true // waiting for the second number
        }
    }
    
    @IBAction func controlButtons(_ sender: UIButton){
        
        // no mathematical operation if no number where given
        // skipping the "C", "Del" and "Equal" buttons
        if isMathPerforming == true && label.text != "" && sender.tag != 11 && sender.tag != 111 && sender.tag != 16 {
            numberOnScreen = Int(label.text!)!
            isWaitingNext = true;
            numberOfOperations += 1

            // Division
            if sender.tag == 12  && numberOnScreen != 0 {
                numberPrevious = numberPrevious! / numberOnScreen!
                label.text = String(numberPrevious!)
                
                // check the sign
                checkSign(result: numberPrevious!)
                // deletes the extra operations from the screen and array
                modifyList()
                // adding the next element to the list of last 10 operations
                addOperation(operation: "/", operand: numberOnScreen!)
            }
                
            else if sender.tag == 12 && numberOnScreen == 0 {
                label.text = String(0)
                
                // check the sign
                checkSign(result: numberPrevious!)
                // deletes the extra operations from the screen and array
                modifyList()
                // adding the next element to the list of last 10 operations
                addOperation(operation: "/", operand: numberOnScreen!)
            }
            
            // Multiplication
            else if sender.tag == 13 {
                numberPrevious = numberPrevious! * numberOnScreen!
                label.text = String(numberPrevious!)
                
                // check the sign
                checkSign(result: numberPrevious!)
                // deletes the extra operations from the screen and array
                modifyList()
                // adding the next element to the list of last 10 operations
                addOperation(operation: "*", operand: numberOnScreen!)
            }
            
            // Substraction
            else if sender.tag == 14 {
                numberPrevious = numberPrevious! - numberOnScreen!
                label.text = String(numberPrevious!)
                
                // check the sign
                checkSign(result: numberPrevious!)
                // deletes the extra operations from the screen and array
                modifyList()
                // adding the next element to the list of last 10 operations
                addOperation(operation: "-", operand: numberOnScreen!)
            }
            
            // Addition
            else if sender.tag == 15 {
                numberPrevious = numberPrevious! + numberOnScreen!
                label.text = String(numberPrevious!)
                
                // check the sign
                checkSign(result: numberPrevious!)
                // deletes the extra operations from the screen and array
                modifyList()
                // adding the next element to the list of last 10 operations
                addOperation(operation: "+", operand: numberOnScreen!)
            }
        }
            
        // "C" = Delete all
        if sender.tag == 11 {
            numberPrevious = 0
            numberOnScreen = 0
            label.text = ""
            showSign.text = ""
            
            // delete last 10 operations
            lastOperations.removeAll()
            showLastOperations.text = ""
            
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
            checkSign(result: numberOnScreen!)
        }
    }
    
    // creates the number on the screen depending from previous settings:
    // the very first number as first operand
    // the second operand
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

