//
//  GameScene.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 31/10/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import SceneKit

public class GameScene: SCNScene {
    
    //    override init() {
    //        super.init()
    //
    //        let aliveCell: Bool = false
    //        let deadColor = UIColor.systemGray5
    //        let aliveColor = UIColor.systemRed
    //
    //        let geometry = SCNBox(width: 0.6 , height: 0.6,
    //                               length: 0.1, chamferRadius: 0.005)
    //
    //        geometry.firstMaterial?.diffuse.contents = deadColor
    //
    //        if aliveCell == true{
    //            geometry.firstMaterial?.diffuse.contents = aliveColor
    //        }else{
    //            aliveCell == false
    //        }
    //
    //        let gridNode = SCNNode(geometry: geometry)
    //        let offset: Int = 16
    //        gridNode.position.z = 0
    //
    //
    //        let x = Int(UIScreen.main.bounds.width/10)
    //        let y = Int(UIScreen.main.bounds.height/10)
    //
    //        for xIndex:Int in 0...x {
    //            for yIndex:Int in 0...y {
    //                let boxCopy = gridNode.copy() as! SCNNode
    //                boxCopy.position.x = Float(xIndex - offset)
    //                boxCopy.position.y = Float(yIndex - offset)
    //                self.rootNode.addChildNode(boxCopy)
    //
    //
    //
    //            }
    //        }
    //    }
    
    override init(){
        super.init()
        
        let grid = Grid()
        
        grid.matrix[1][3].isAlive = 1
        grid.matrix[2][2].isAlive = 1
        grid.matrix[2][3].isAlive = 1
        grid.matrix[3][3].isAlive = 1
        grid.matrix[3][4].isAlive = 1
        
        let rows = grid.matrix.count
        
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
                
        for i in 0..<rows{
            var str: String = ""
            for j in 0..<cols{
                str.append("\(grid.matrix[i][j].isAlive)")
            }
            print(str)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
