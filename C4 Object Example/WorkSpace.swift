//
//  WorkSpace.swift
//  C4 Object Example
//
//  Created by MASOOD KAMANDY on 10/28/19.
//  Copyright © 2019 Masood Kamandy. All rights reserved.
//

import UIKit
import C4

class WorkSpace: CanvasController {
  
  var robots = [RectRobot]()
  
  override func setup() {
      
      self.canvas.backgroundColor = black
      createDisplayLink()
      
      canvas.addTapGestureRecognizer { locations, center, state in
          self.robots.append(RectRobot(canvas: self.canvas, size: random(in: 25..<201), thickness: random(in: 1..<16), movementMax: random(in: 1..<26)))
          randomBackgroundColor(canvas: self.canvas)
      }
      
      
      canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
          clearScreen(canvas: self.canvas)
          self.robots.removeAll()
      }
      
  }
  
  
  func draw() {
      for robot in robots {
          robot.cycleColors()
          robot.move()
      }
  }
  
  
  func createDisplayLink() {
      let displaylink = CADisplayLink(target: self,
                                      selector: #selector(step))
      
      //displaylink.preferredFramesPerSecond = 60
      
      displaylink.add(to: .current,
                      forMode: .defaultRunLoopMode)
  }
       
  @objc func step(displaylink: CADisplayLink) {
      draw()
  }
  
}



