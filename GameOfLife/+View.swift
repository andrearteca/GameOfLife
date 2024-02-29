//
//  +View.swift
//  GameOfLife
//
//  Created by André Arteca on 29/02/24.
//

import Foundation
import SwiftUI

extension View{
    //essa função reconhece quais são os vizinhos e conta quantos estão vivos
    func verVizinhos(l: Int, c: Int, m1: [[Int]]) -> Int{
        
        //variável que vai armazenar a quantidade de vizinhos
        var livingNeghbours: Int = 0
        
        //variável que vai criar uma nova matriz com as linhas vizinhas
        var novaMatriz: [[Int]] {
            
            //o switch case a partir do índice da linha vai retornar matrizes diferentes
            switch l {
                //essa regra é para a primeira linha, que reconhece apenas ela mesma e a de baixo
            case 0: return [m1[l], m1[l+1]]
                //essa regra é para a ultima linha, que reconhece apenas a linha de cima e ela mesma
            case m1.count-1: return [m1[l-1], m1[l]]
                //e como padrão reconhece a linha de cima, ela mesma e a de baixo.
            default: return [m1[l-1], m1[l], m1[l+1]]
            }
         
        }
         
        //a partir das linhas da nova matriz vai gera uma repetição que individualiza as linhas
        for linha in novaMatriz{
            
            //essa variável crar uma nova matriz com as colunas vizinhas
            var newLinha : [Int] {
                //é a mesma variável, mas pra ser usada no switch case com o append
                var newVetor: [Int] = []
                switch c {
                    
                    //essa regra é para a primeira coluna, que reconhece apenas ela mesma e a da direita
                case 0: return {
                    newVetor.append(contentsOf: linha[c...c+1])
                    return newVetor
                }()
                    //essa regra é para a última coluna, que reconhece apenas a da esquerda e ela mesma
                case linha.count-1: return {
                    newVetor.append(contentsOf: linha[c-1...c])
                    return newVetor
                }()
                    //como padrão, reconhece a da esquerda, ela mesma e a da direita
                default: return {
                    newVetor.append(contentsOf: linha[c-1...c+1])
                    return newVetor
                }()
                }
            }
            
            //uma repetição que individualiza elementos na nova linha criada.
            for cell in newLinha{
                //reconhece se a célula está viva, então adiciona 1 a variável de vizinhos vivos
                if cell == 1{
                    livingNeghbours += 1
                }
            }
        }
        
        //vê se a célula selecionada está viva, se ela estiver, vai subtrair 1 dos vizinhos vivos.
        if m1[l][c] == 1{
            livingNeghbours -= 1
        }
        return livingNeghbours
    }
    
    
    
    func gerarProxima(matriz: [[Int]]) -> [[Int]]{
        var newMatriz = [[Int]]()

//        print("_________________")
        //repetição que individualiza as linhas e printa a matriz original
//        for linha in matriz2.indices{
//            print(matriz2[linha])
//        }

    //repetição que individualiza as linhas
        for linha in matriz.indices{
            //variável que vai servir para as linhas da próxima geração
            var newLinha = [Int]()
            
            //repetição que individualiza as colunas
            for coluna in matriz[linha].indices{
                
                //variável que vai armazenar a quantidade de vizinhos de uma célula específica
                let neighbours = verVizinhos(l: linha, c: coluna, m1: matriz)
                
                //variável que vai armazenar o novo valor da célula
                var newCell: Int = 0
                
                
                //conicional para saber se a célula está morta
                if matriz[linha][coluna] == 0{
                    
                    //regra para gerar uma célula viva
                    if neighbours == 3{
                        newCell = 1
                    } else{
                        newCell = 0
                    }
                }
                
                //condicional para saber se a célula está viva
                if matriz[linha][coluna] == 1{
                    
                    //regra para matar uma célula por subpopulação
                    if neighbours < 2{
                        newCell = 0
                    }
                    
                    // regras para manter a célula viva
                    if neighbours == 2{
                        newCell = 1
                    }
                    if neighbours == 3{
                        newCell = 1
                    }
                    
                    //regra para matar uma célula por superpopulação
                    if neighbours > 3{
                        newCell = 0
                    }
                }
                //aqui vai adicionar cada nova célula em suas novas linhas
                newLinha.append(newCell)
            }
            //aqui vai adicionar cada nova linha em uma matriz
            newMatriz.append(newLinha)
        }
        
        print("_________________")
        for linha in newMatriz.indices{
            print(newMatriz[linha])
        }
        
        //então substitui o valor das matriz antiga pela nova
        return newMatriz
        
        
        
    }
}
