//
//  GameScene.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 31/10/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import SceneKit

class GameScene: SCNScene {

    override init() {
        super.init()

        let geometry = SCNBox(width: 0.6 , height: 0.6,
                               length: 0.1, chamferRadius: 0.005)
        geometry.firstMaterial?.diffuse.contents = UIColor.systemGray5
        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 16
        
        let x = Int(UIScreen.main.bounds.width/8)
        let y = Int(UIScreen.main.bounds.height/8)

        for xIndex:Int in 0...x {
            for yIndex:Int in 0...y {
                let boxCopy = boxnode.copy() as! SCNNode
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                self.rootNode.addChildNode(boxCopy)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
