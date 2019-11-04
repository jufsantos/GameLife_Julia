//
//  CubeCell.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 01/11/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import SceneKit
import Foundation

class CubeCell {
    var x: Int
    var y: Int
    
    var isAlive: Int = 0
    
    init(x: Int, y: Int, isAlive: Int = 0) {
        self.x = x
        self.y = y
        self.isAlive = isAlive
    }
}
