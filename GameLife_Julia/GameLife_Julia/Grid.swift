//
//  Grid.swift
//  GameLife_Julia
//
//  Created by Julia Santos on 04/11/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit

class Grid {
    
    var matrix: [[CubeCell]] = []
    let nRow = 10
    let nCols = 15

           
    
    init() {
       
        for i in 0...nRow-1{ // percorrendo todas as linhas
            //criar nova linha
            var singleRow = [CubeCell]()
            for j in 0...nCols-1 { //percorrendo todas as linhas
                singleRow.append(CubeCell(x: j, y: i))
            }
            //colocar nova linha na matrix
            matrix.append(singleRow)
        }
    }
    
    func getCell (x: Int, y: Int) -> CubeCell?{
        if x >= nCols || x < 0 || y >= nRow || y < 0 {
            return nil
        } else{
            
            return matrix[y][x]
        }
    }
    
    func getLiveNeighbours(cell: CubeCell)  -> Int {
        var count = 0
        for m in -1...1{
            for n in -1...1{
                if let cell = getCell(x: cell.x + m, y: cell.y + n) {
                    if cell.isAlive == 1 {
                        count += 1
                    }
                }
            }
        }
        return count
    }
}
