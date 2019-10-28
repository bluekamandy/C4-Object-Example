//
//  RectRobot.swift
//  Art61_BasicTemplate
//
//  Created by Masood on 10/20/19.
//  Copyright © 2019 Masood Kamandy. All rights reserved.
//

import Foundation
import C4

class RectRobot {
    
    var canvas: C4.View
    var size, thickness, movementMax, x, y: Int
    var rectangles:[C4.Rectangle]
    
    init(canvas: C4.View, size: Int, thickness: Int, movementMax: Int) {
        self.canvas = canvas
        self.size = size
        self.thickness = thickness
        self.movementMax = movementMax
        self.x = random(below: Int(self.canvas.width))
        self.y = random(below: Int(self.canvas.height))
        self.rectangles = [C4.Rectangle]()
        
        for i in stride(from: 0, to: self.size, by: self.thickness) {
            ShapeLayer.disableActions = true
            var currentRectangle = Rectangle(frame: Rect(self.x, self.y, self.size-i, self.size-i))
            currentRectangle.center = Point(self.x, self.y)
            currentRectangle.corner = Size()
            currentRectangle.fillColor = Color(red: random(below: 255), green: random(below: 255), blue: random(below: 255), alpha: 1.0)
            currentRectangle.strokeColor = clear
            self.rectangles.append(currentRectangle)
        }
        
        for rectangle in rectangles {
            self.canvas.add(rectangle)
        }
    }

    func cycleColors() {
        for rectangle in rectangles {
            ShapeLayer.disableActions = true
            rectangle.fillColor = Color(red: random(below: 255), green: random(below: 255), blue: random(below: 255), alpha: 1.0)
        }
    }
    
    func move() {
        self.x += random(in: -movementMax..<(movementMax+1))
        self.y += random(in: -movementMax..<(movementMax+1))
        
        for rectangle in rectangles {
            //ShapeLayer.disableActions = true
            rectangle.center = Point(self.x, self.y)
        }
    }
}
