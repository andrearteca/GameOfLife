//
//  MatrizPoc.swift
//  GameOfLife
//
//  Created by André Arteca on 28/02/24.
//

import SwiftUI

struct MatrizPoc: View {
    
//    @State var matriz = [[Int]]()
    
    @State var matriz2 = [
        [0, 1, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
    ]
    
    var body: some View {
        Button("Print"){
//            criarMatriz()
//            verVizinhos(l: 0, c: 1, m1: matriz2)
            gerarProxima(matriz: matriz2)
        }
    }
    
    
   
    

    
}

#Preview {
    MatrizPoc()
}
