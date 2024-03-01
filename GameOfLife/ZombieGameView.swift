//
//  ZombieGameView.swift
//  GameOfLife
//
//  Created by André Arteca on 01/03/24.
//

import SwiftUI

struct ZombieGameView: View {
    
    @State var cellGrid: [[ZombieCell]] = Array(repeating: Array(repeating: ZombieCell(isAlive: false, didDie: false), count: 16), count: 6)
  
    
    var body: some View {
        GeometryReader{ geo in
            NavigationStack{
                VStack(alignment: .center){
                    Text("Toque para adicionar humanos")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 10)
                    ForEach(cellGrid.indices){ linha in
                        HStack{
                            ForEach(cellGrid[linha].indices){ coluna in
                                Text(cellGrid[linha][coluna].isAlive == true ? cellGrid[linha][coluna].didDie == true ? "🧟‍♂️" : "🙍‍♂️" : "💀")
                                    .font(.title)
    //                                .fill(cellGrid[linha][coluna].isAlive == true ? .blue : .black)
    //                                .scaleEffect(cellGrid[linha][coluna].isAlive == true ? 1.5 : 1)
    //                                .frame(width: 20)
                                    .onTapGesture {
                                       
                                            cellGrid[linha][coluna].isAlive.toggle()
                                        
                                    }
                            }
                        }
                    }
                    HStack {
                        
                        Spacer()
                        Button("Próxima Geração"){
                            
                                gerarProximaZombie(matriz: &cellGrid)
                            
                        }
                        .buttonStyle(.borderedProminent)
                      
                       
                    }
                    .padding(.vertical)
                    
                }
              
                .position(x: geo.size.width/2, y: geo.size.height/2)
                .toolbar {
                    Button("Reset"){
                    cellGrid = Array(repeating: Array(repeating: ZombieCell(isAlive: false, didDie: false), count: 16), count: 8)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ZombieGameView()
}



