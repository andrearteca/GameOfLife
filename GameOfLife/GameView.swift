//
//  GameView.swift
//  GameOfLife
//
//  Created by André Arteca on 29/02/24.
//

import SwiftUI

struct GameView: View {
    
    @State var matriz = [
        [0, 1, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
    ]
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ForEach(matriz, id: \.self){ linha in
                    HStack{
                        ForEach(linha, id: \.self){ cell in
                            Circle()
                                .fill(cell == 1 ? .blue : .black)
                                .frame(width: 20)
                                
                        }
                    }
                }
                Button("Próxima Geração"){
                    matriz = gerarProxima(matriz: matriz)
                }
                
            }
            .position(x: geo.size.width/2, y: geo.size.height/2)
        }
    }
}

#Preview {
    GameView()
}
