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

    var numberOnScreen:Double = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func controlButtons(_ sender: Any) {
        // no mathematical operation if no number where given
    }
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        label.text = label.text! + String(sender.tag - 1)
        numberOnScreen = Double(label.text!)!
        print(sender.currentTitle!)
        print(sender.tag)
    }
    
}

