//
//  C4_Functions.swift
//  Art61_BasicTemplate
//
//  Created by Masood on 10/7/19.
//  Copyright © 2019 Masood Kamandy. All rights reserved.
//

import Foundation
import C4

func randomBackgroundColor(canvas: C4.View) {
    canvas.backgroundColor = Color(
        red: random(below: 256),
        green: random(below: 256),
        blue: random(below: 256),
        alpha: 1.0)
}

func clearScreen(canvas: C4.View) {
    for view in canvas.view.subviews{
        view.removeFromSuperview()
    }
}

