//
//  Line.swift
//  TicTacToe_Two_Players
//
//  Created by Oleksandra Baga on 02.05.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

// I have created the lines in Swift but then I have decided to use an image to draw the game field
// Because I don't see the created field on the Main.storyboard
// I think (at least for now) it would be hard to place the futher design elemens.
// and I would not like to calculate the position of the all buttons.
// Anyway I will save this code just for my educational purpose.

import UIKit

class Line: UIView {
    // Performing custom drawing.
    
    var lineVertLeft = UIBezierPath()
    var lineVertRight = UIBezierPath()
    var lineHorizTop = UIBezierPath()
    var lineHorizBottom = UIBezierPath()

    
    func drawGameField() {
        
        UIColor.darkGray.setStroke()

        // Left Vertical Line
        // starting location
        lineVertLeft.move(to: .init(x: bounds.width * 0.375, y: 100))
        // end location
        lineVertLeft.addLine(to: .init(x: bounds.width * 0.375, y: bounds.height * 0.6 ))
        UIColor.darkGray.setStroke()
        lineVertLeft.lineWidth = 2
        lineVertLeft.stroke()
        
        // Right Vertical Line
        // starting location
        lineVertRight.move(to: .init(x: bounds.width * 0.625, y: 100))
        // end location
        lineVertRight.addLine(to: .init(x: bounds.width * 0.625, y: bounds.height * 0.6 ))
        lineVertRight.lineWidth = 2
        lineVertRight.stroke()
        
        // Top Horizontal Line
        // starting location
        lineHorizTop.move(to: .init(x: bounds.width * 0.125, y: bounds.height * 0.3))
        // end location
        lineHorizTop.addLine(to: .init(x: bounds.width * 0.875, y: bounds.height * 0.3 ))
        lineHorizTop.lineWidth = 2
        lineHorizTop.stroke()
        
        // Bottom Horizontal Line
        // starting location
        lineHorizBottom.move(to: .init(x: bounds.width * 0.125, y: bounds.height * 0.45))
        // end location
        lineHorizBottom.addLine(to: .init(x: bounds.width * 0.875, y: bounds.height * 0.45 ))
        lineHorizBottom.lineWidth = 2
        lineHorizBottom.stroke()
    }
    

    /*
    override func draw(_ rect: CGRect) {
        // Drawing code
        // drawGameField()
    }
 */

}
