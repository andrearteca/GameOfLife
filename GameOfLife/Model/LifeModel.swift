////
////  GridModel.swift
////  GameOfLife
////
////  Created by André Arteca on 27/02/24.
////
//
//import Foundation
//
//struct LifeModel{
//    var size: (Int,Int)
//    var isPaused: Bool
//    var cells: [[Cell]]
//    
//    init(size: (Int, Int),isPaused: Bool, grid: [[Cell]]) {
//        self.size = size
//        self.isPaused = isPaused
//        self.cells = Array(repeating: Array(repeating: Cell(isAlive: false), count: size.0), count: size.1)
//        self.randomise()
//        self.gameLoop()
//    }
//    
    
//    
//    mutating func gameLoop(){
//
//            var newCells = cells
//            let numberOfRows = cells.count
//            let numberOfColumns = cells[0].count
//            
//            for row in 0..<numberOfRows{
//                for column in 0..<numberOfColumns{
//                    let cell = cells[row][column]
//                    let neighbors  = neighbors(ofRow: row, andColumn: column)
//                    let aliveNeighbors = neighbors.filter{$0.isAlive}.count
//                    
//                    if cell.isAlive{
//                        if aliveNeighbors < 2 || aliveNeighbors > 3{
//                            newCells[row][column].isAlive = false
//                        }
//                    } else if aliveNeighbors == 3 {
//                        newCells[row][column].isAlive = true
//                    }
//                }
//            }
//            
//            cells = newCells
//            if !isPaused {
//                self.gameLoop()
//            }
//    }
//    
//    func neighbors(ofRow row: Int, andColumn column: Int) -> [Cell] {
//        let numberOfRows = cells.count
//        let numberOfColumns = cells.count
//        var neighboringCells = [Cell]()
//        
//        for r in max(0,row - 1)...min(row + 1, numberOfRows - 1){
//            for c in max(0,column - 1)...min(column + 1, numberOfColumns - 1){
//                if !(r == row && c == column){
//                    neighboringCells.append(cells[r][c])
//                }
//            }
//        }
//        return neighboringCells
//    }
//}
