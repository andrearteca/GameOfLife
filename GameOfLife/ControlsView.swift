//
//  ControlsView.swift
//  GameOfLife
//
//  Created by André Arteca on 27/02/24.
//

import SwiftUI

struct ControlsView: View {
    
    @Binding var isPaused: Bool
    var onReset: ()->Void
    
    
    var body: some View {
        HStack{
            Button("Play"){
                isPaused.toggle()
            }
            Button("Reset"){
                onReset()
            }
        }
    }
}


