//
//  GameTitleView.swift
//  GameOfLife
//
//  Created by André Arteca on 01/03/24.
//

import SwiftUI

struct GameTitleView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                VStack{
                    Text("The Walking Dead")
                        .font(.largeTitle)
                        .bold()
                    Text("Simulator")
                        .font(.title2)
                        .italic()
                }
          
                NavigationLink(destination: ZombieGameView()) {
                    Text("Começar")
                        .font(.title3)
                    
                        
                }
                .buttonStyle(.borderedProminent)

            }  
            .padding()
        }
    }
}

#Preview {
    GameTitleView()
}
