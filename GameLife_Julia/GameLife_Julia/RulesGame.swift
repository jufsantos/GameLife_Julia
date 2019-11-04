//
//  RulesGame.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 01/11/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import SceneKit

class RulesGame: SCNNode {
    
    override init() {
    super.init()
        
        let box = SCNBox(width: 0.8, height: 0.8,
        length: 0.1, chamferRadius: 0.005)
        box.firstMaterial?.diffuse.contents = UIColor.systemRed
        let boxnode = SCNNode(geometry: box)
        boxnode.position.z = 10
        boxnode.position.x = Float(UIScreen.main.bounds.width/2)
        boxnode.position.y = Float(UIScreen.main.bounds.height/2)
        
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
