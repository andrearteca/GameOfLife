//
//  CellView.swift
//  GameOfLife
//
//  Created by André Arteca on 27/02/24.
//

import SwiftUI

struct CellView: View {
    
    @Binding var cell: Cell
    
    var color: Color{
        cell.isAlive ? Color.green : Color.black
    }
    
    var body: some View {
       Circle()
            .fill(color)
            .frame(minWidth: 5, maxWidth: 20, minHeight: 5, maxHeight: 20)
            .scaleEffect(cell.isAlive ? 1.5 : 1)
            .onTapGesture {
                withAnimation {
                    cell.isAlive.toggle()
                }
            }
    }
}
