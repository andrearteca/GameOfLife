//
//  MatrizPoc.swift
//  GameOfLife
//
//  Created by André Arteca on 28/02/24.
//

import SwiftUI

struct MatrizPoc: View {
    
    @State var matriz = [[Int]]()
    
    @State var matriz2 = [
        [1, 0, 1, 2],
        [0, 1, 0, 2],
        [0, 1, 0, 2],
        [2, 2, 2, 2]
    ]
    
    var body: some View {
        Button("Print"){
//            criarMatriz()
            verVizinhos(l: 0, c: 1, m1: matriz2)
        }
    }
    
    func verVizinhos(l: Int, c: Int, m1: [[Int]]){
        
        var livingNeghbours: Int = 0
        
        var novaMatriz: [[Int]] {
            switch l {
            case 0: return [m1[l], m1[l+1]]
            case m1.count-1: return [m1[l-1], m1[l]]
            default: return [m1[l-1], m1[l], m1[l+1]]
            }
         
        }
            print("_________________")
        for linha in novaMatriz{
            var newLinha : [Int] {
                var newVetor: [Int] = []
                switch c {
                case 0: return {
                    newVetor.append(contentsOf: linha[c...c+1])
                    return newVetor
                }()
                case linha.count-1: return {
                    newVetor.append(contentsOf: linha[c-1...c])
                    return newVetor
                }()
                default: return {
                    newVetor.append(contentsOf: linha[c-1...c+1])
                    return newVetor
                }()
                }
            }
            for cell in newLinha{
                if cell == 1{
                    livingNeghbours += 1
                }
            }
        }
        
        if m1[l][c] == 1{
            livingNeghbours -= 1
        }
        print(livingNeghbours)
    }
    
    func criarMatriz(){
        
        
        matriz.append([0,1])
        matriz.append([1,0])
        
        //repetição que individualiza as linhas
        for linha in matriz.indices{
            
        //repetição que individualiza os elementos de cada linha
            for elemento in matriz[linha] {
                print(elemento)
            }
        }
        
        
        
       

//        print(matriz[0])
//        print(matriz[1])
    }
}

#Preview {
    MatrizPoc()
}
