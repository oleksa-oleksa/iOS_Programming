//
//  ViewController.swift
//  postfix_calculator
//
//  Created by Oleksandra Baga on 12.04.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

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

    var numberOnScreen:Int = 0;
    var numberPrevious:Int = 0;
    var isMathPerforming = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func controlButtons(_ sender: UIButton) {
        // If Enter pressed - we have to save the first number.
        // The case only relevant for the first digit
        // Тут продолжить ПЕрвая цифра Энтер Вторая цифра операция
        // а потом снова цифра и операция цифра и операция
        if sender.tag == 16 {
            numberPrevious = Int(label.text!)!
            label.text = "" // clears the screen from the previous number
            isMathPerforming = true
        }
        
        // no mathematical operation if no number where given
        // skipping the "C", "Del" and "Equal" buttons
        if isMathPerforming == true && label.text != "" && sender.tag != 11 && sender.tag != 111 && sender.tag != 16 {
            numberOnScreen = Int(label.text!)!
            
            // Division
            if sender.tag == 12 {
                numberPrevious = numberPrevious / numberOnScreen
                label.text = String(numberPrevious)
            }
            
            // Multiplication
            else if sender.tag == 13 {
                numberPrevious = numberPrevious * numberOnScreen
                label.text = String(numberPrevious)
            }
            
            // Substraction
            else if sender.tag == 14 {
                numberPrevious = numberPrevious - numberOnScreen
                label.text = String(numberPrevious)
            }
            
            // Addition
            else if sender.tag == 15 {
                numberPrevious = numberPrevious + numberOnScreen
                label.text = String(numberPrevious)
            }
            
            isMathPerforming = false; // disable operation
        }
            
        // "C" = Delete all
        else if sender.tag == 11 {
            numberPrevious = 0
            numberOnScreen = 0
            label.text = ""
        }
        
        // "Del" = Delete the last digit of the numberOnScreen
        else if sender.tag == 111 {
            numberOnScreen = Int(label.text!)!
            numberOnScreen = numberOnScreen / 10
            label.text = String(numberOnScreen)
        }
    }
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        
        if isMathPerforming == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Int(label.text!)!
            isMathPerforming = false
        }
            
        else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Int(label.text!)!
            
        }
        
        //debug information
        print(sender.currentTitle!)
        print(sender.tag)
    }
    
}

