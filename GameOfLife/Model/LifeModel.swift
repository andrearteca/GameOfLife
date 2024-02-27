//
//  GridModel.swift
//  GameOfLife
//
//  Created by André Arteca on 27/02/24.
//

import Foundation

struct LifeModel{
    var size: (Int,Int)
    var cells: [[Cell]]
    
    init(size: (Int, Int), grid: [[Cell]]) {
        self.size = size
        self.cells = Array(repeating: Array(repeating: Cell(isAlive: false), count: size.0), count: size.1)
        self.randomise()
    }
    
    mutating func randomise(){
        for r in 0..<size.0{
            for c in 0..<size.1{
                cells[r][c] = (Int.random(in: 1..<100))%3 == 0 ? Cell(isAlive: true): Cell(isAlive: false)
            }
        }
    }   
}
