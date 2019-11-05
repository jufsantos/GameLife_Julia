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
    
    var grid = Grid()
    let rulesGame = RulesGame()
    let deadColor = UIColor.systemGray5
    let aliveColor = UIColor.systemRed
    let offset: Int = 40
    var nodes: [SCNNode] = []
    
    override init(){
        super.init()

        grid.matrix[1][3].isAlive = 1
        grid.matrix[2][2].isAlive = 1
        grid.matrix[2][3].isAlive = 1
        grid.matrix[3][3].isAlive = 1
        grid.matrix[3][4].isAlive = 1
        
        drawGrid()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func drawGrid(){
        
        let rows = grid.matrix.count
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
        
        for i in 0..<rows {
            var str: String = ""
            for j in 0..<cols{
                str.append("\(grid.matrix[i][j].isAlive)")
                let boxGeometry = SCNBox(width: 0.8 , height: 0.8, length: 0.8, chamferRadius: 0.005)
                let boxCopy = SCNNode(geometry: boxGeometry)
                if grid.matrix[i][j].isAlive == 1{
                    boxCopy.geometry?.firstMaterial?.diffuse.contents = aliveColor
                }else{
                    boxCopy.geometry?.firstMaterial?.diffuse.contents = deadColor
                }
                boxCopy.position.x = Float(i - offset)
                boxCopy.position.y = Float(j - offset)
                nodes.append(boxCopy)
                self.rootNode.addChildNode(boxCopy)
            }
            print(str)
        }
    }
    
    func touchedScreen(){
        for i in 0..<nodes.count{
            nodes[i].removeFromParentNode()
        }
        nodes = []
        grid = rulesGame.step(grid: grid)
        drawGrid()
        
    }
}
