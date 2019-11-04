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
    
    init() {
        let x = 15
        let y = 10
        
        for i in 0...x-1{ // percorrendo todas as linhas
            //criar nova linha
            var singleRow = [CubeCell]()
            for j in 0...y-1 { //percorrendo todas as linhas
                singleRow.append(CubeCell(x: j, y: i))
            }
            //colocar nova linha na matrix
            matrix.append(singleRow)
        }
    }

}
