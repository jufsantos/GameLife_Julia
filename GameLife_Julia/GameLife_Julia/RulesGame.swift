//
//  RulesGame.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 01/11/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import SceneKit

class RulesGame: SCNNode {
    
    var callCell: [[CubeCell]] = []
    
    override init() {
    super.init()
}
    func step (grid: Grid){
        
        for row in callCell {
            for cell in row {
                if cell.isAlive == 0 {
                    let count = grid.getLiveNeighbours(cell: cell) - 1
                    if count == 3 {
                        cell.isAlive = 1
                    }
                } else {
                    let count = grid.getLiveNeighbours(cell: cell)
                    if count < 2 && count > 3 {
                        cell.isAlive = 0
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
