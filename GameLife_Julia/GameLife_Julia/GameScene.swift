//
//  GameScene.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 31/10/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import SceneKit

class GameScene: SCNScene {

    override init() {
        super.init()

        let geometry = SCNBox(width: 0.6 , height: 0.6,
                               length: 0.1, chamferRadius: 0.005)

        geometry.firstMaterial?.diffuse.contents = UIColor.red
        geometry.firstMaterial?.specular.contents = UIColor.white
        geometry.firstMaterial?.emission.contents = UIColor.blue
        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 16

        for xIndex:Int in 0...32 {
            for yIndex:Int in 0...32 {
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
