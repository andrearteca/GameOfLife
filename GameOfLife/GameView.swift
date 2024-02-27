//
//  GameView.swift
//  GameOfLife
//
//  Created by André Arteca on 27/02/24.
//

import SwiftUI

struct GameView: View {
    
    @Binding var cells: [[Cell]]
    @Binding var isPaused: Bool

    
    var body: some View {
        VStack{
            ForEach(0..<cells.count, id:\.self){ row in
                HStack{
                    ForEach(0..<self.cells[row].count, id:\.self) { column in
                        CellView(cell: self.$cells[row][column])
    //                    cell.isAlive == true
    //                        .animation(<#T##animation: Animation?##Animation?#>, value: <#T##Equatable#>)
                    }
                }
            }
            Button("Randomise"){
                randomise()
            }
        }
        .onAppear{
                randomise()
                gameLoop()
            
        }
        .onChange(of: isPaused) { newValue in
            if !newValue{
                withAnimation {
                    self.gameLoop()
                }
            }
        }
    }
}

