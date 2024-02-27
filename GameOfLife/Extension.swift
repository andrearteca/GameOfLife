//
//  Extension.swift
//  GameOfLife
//
//  Created by André Arteca on 27/02/24.
//

import Foundation
import SwiftUI

extension GameView{
    
    func gameLoop(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                var newCells = cells
                let numberOfRows = cells.count
                let numberOfColumns = cells[0].count
                
                for row in 0..<numberOfRows{
                    for column in 0..<numberOfColumns{
                        let cell = cells[row][column]
                        let neighbors  = neighbors(ofRow: row, andColumn: column)
                        let aliveNeighbors = neighbors.filter{$0.isAlive}.count
                        
                
                            if cell.isAlive{
                                if aliveNeighbors < 2 || aliveNeighbors > 3{
                                        newCells[row][column].isAlive = false
                                }
                            } else if aliveNeighbors == 3 {
                               
                                    newCells[row][column].isAlive = true
                            }
                    }
                }
                
                cells = newCells
                if !isPaused {
                    self.gameLoop()
                }
            }
            
        }
    
    func randomise(){
        for r in 0..<cells.count{
            for c in 0..<cells.count{
                cells[r][c] = (Int.random(in: 1..<100))%3 == 0 ? Cell(isAlive: true): Cell(isAlive: false)
            }
        }
    }

    
    func neighbors(ofRow row: Int, andColumn column: Int) -> [Cell] {
        let numberOfRows = cells.count
        let numberOfColumns = cells.count
        var neighboringCells = [Cell]()
        
        for r in max(0,row - 1)...min(row + 1, numberOfRows - 1){
            for c in max(0,column - 1)...min(column + 1, numberOfColumns - 1){
                if !(r == row && c == column){
                    neighboringCells.append(cells[r][c])
                }
            }
        }
        return neighboringCells
    }
}
