//
//  ViewController.swift
//  myFirstLove
//
//  Created by Oleksandra Baga on 12.04.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var n = 0

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.text = "MySecondLove"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonBomb(_ sender: Any) {
        n += 1
        display.text = String(n)
    }
    
}

