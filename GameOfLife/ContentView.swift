//
//  ContentView.swift
//  GameOfLife
//
//  Created by André Arteca on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var cells: [[Cell]] = Array(repeating: Array(repeating: Cell(), count: 10), count: 10)
    @State var isPaused: Bool = true
    
    var body: some View {
        VStack {
            GameView(cells: $cells, isPaused: $isPaused)
            ControlsView(isPaused: $isPaused, onReset: reset)
        }
  
    }
    
    
    func reset(){
   
        withAnimation {
            cells = Array(repeating: Array(repeating: Cell(), count: 10), count: 10)
        }
    }
}

#Preview {
    ContentView()
}
