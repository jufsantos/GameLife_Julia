//
//  GameScene.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 31/10/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import SceneKit

public class GameScene: SCNScene, SCNSceneRendererDelegate {
    
    var grid = Grid()
    let rulesGame = RulesGame()
    let deadColor = UIColor.systemGray5
    let aliveColor = UIColor.systemRed

    let offset: Int = 4
    var nodes: [SCNNode] = []
    let boxGeometry = SCNBox(width: 0.8 , height: 0.8, length: 0.8, chamferRadius: 0.005)
    let cameraNode = SCNNode()
    let lightNode = SCNNode()
    let ambientLightNode = SCNNode()
    var z: Float = 0
    
    override init(){
        super.init()
        setupScene()
        self.boxGeometry.firstMaterial?.diffuse.contents = aliveColor

        grid.matrix[1][3].isAlive = 1
        grid.matrix[2][2].isAlive = 1
        grid.matrix[2][3].isAlive = 1
        grid.matrix[3][3].isAlive = 1
        grid.matrix[3][5].isAlive = 1
        
        grid.matrix[4][5].isAlive = 1
        grid.matrix[4][6].isAlive = 1
        grid.matrix[5][4].isAlive = 1
        grid.matrix[6][9].isAlive = 1
        grid.matrix[4][1].isAlive = 1

        grid.matrix[6][7].isAlive = 1
        grid.matrix[8][9].isAlive = 1
        grid.matrix[1][11].isAlive = 1
        grid.matrix[10][2].isAlive = 1
        grid.matrix[10][13].isAlive = 1
        
        grid.matrix[5][6].isAlive = 1
        grid.matrix[5][7].isAlive = 1
        grid.matrix[6][6].isAlive = 1
        grid.matrix[9][8].isAlive = 1
        grid.matrix[9][3].isAlive = 1
        
        grid.matrix[7][8].isAlive = 1
        grid.matrix[8][4].isAlive = 1
        grid.matrix[4][3].isAlive = 1
        grid.matrix[9][11].isAlive = 1
        grid.matrix[6][10].isAlive = 1
        
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
                if grid.matrix[i][j].isAlive == 1{
                    let boxCopy = SCNNode(geometry: boxGeometry)
                    boxCopy.position.x = Float(i - offset)
                    boxCopy.position.y = Float(j - offset)
                    boxCopy.position.z = z
                    nodes.append(boxCopy)
                    self.rootNode.addChildNode(boxCopy)
                }
            }
            print(str)
        }
    }
    let interval: TimeInterval = 0.1
    var nextTime: TimeInterval = 0
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if nextTime < time{
            reload()
            nextTime = time + interval
        }
    }
    func setupScene() {
        // create and add a light to the scene
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        self.rootNode.addChildNode(lightNode)

        // create and add an ambient light to the scene
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.systemGray
        self.rootNode.addChildNode(ambientLightNode)
        
        // create and add a camera to the scene
        cameraNode.camera = SCNCamera()
//        cameraNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0.1, y: 0, z: 0, duration: 1)))
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: -25, z: 10)
        cameraNode.look(at: SCNVector3 (0, 0, 0))
        self.rootNode.addChildNode(cameraNode)
    }
    func reload(){
        z = z + 0.8
        lightNode.position.z += 0.8
        ambientLightNode.position.z += 0.8
        cameraNode.position.z += 0.8
        grid = rulesGame.step(grid: grid)
        drawGrid()
    }
}
