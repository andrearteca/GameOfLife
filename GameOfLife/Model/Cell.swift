//
//  Cell.swift
//  GameOfLife
//
//  Created by André Arteca on 29/02/24.
//

import Foundation
import SwiftUI

struct Cell: Identifiable, Hashable{
    let id = UUID()
    var isAlive: Bool
    var nextStep: Bool?
}
