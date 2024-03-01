//
//  CellGameView.swift
//  GameOfLife
//
//  Created by André Arteca on 29/02/24.
//

import SwiftUI

struct CellGameView: View {
    
    @State var cellGrid: [[Cell]] = Array(repeating: Array(repeating: Cell(isAlive: false), count: 7), count: 7)
  
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ForEach(cellGrid.indices){ linha in
                    HStack{
                        ForEach(cellGrid[linha].indices){ coluna in
                            Circle()
                                .fill(cellGrid[linha][coluna].isAlive == true ? .blue : .black)
                                .scaleEffect(cellGrid[linha][coluna].isAlive == true ? 1.5 : 1)
                                .frame(width: 20)
                                .onTapGesture {
                                    withAnimation {
                                        cellGrid[linha][coluna].isAlive.toggle()
                                    }
                                }
                        }
                    }
                }
                Button("Próxima Geração"){
                    withAnimation {
                        gerarProximaCell(matriz: &cellGrid)
                    }
                }
                .padding()
            }
            .position(x: geo.size.width/2, y: geo.size.height/2)
        }
    }
}

#Preview {
    CellGameView()
}
