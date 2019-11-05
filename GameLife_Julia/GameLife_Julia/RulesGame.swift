//
//  RulesGame.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 01/11/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import SceneKit

class RulesGame: SCNNode {
    
//    var callCell: [[CubeCell]] = []
    var grid = Grid()
    
    override init() {
    super.init()
        
    }
    func step (grid: Grid) -> Grid{
        let grid2 = Grid()
        
        for row in 0..<grid.matrix.count {
            for col in 0..<grid.matrix[0].count {
                if grid.matrix[row][col].isAlive == 0 {
                    let count = grid.getLiveNeighbours(cell: grid.matrix[row][col])
                    if count == 3 {
                        grid2.matrix[row][col].isAlive = 1
                    }
                } else {
                    let count = grid.getLiveNeighbours(cell: grid.matrix[row][col]) - 1
                    if count < 2 || count > 3 {
                        grid2.matrix[row][col].isAlive = 0
                    }else{
                        grid2.matrix[row][col].isAlive = 1
                    }
                }
            }
        }
        return grid2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
