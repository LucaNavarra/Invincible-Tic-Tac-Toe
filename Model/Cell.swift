//
//  Cell.swift
//
//
//  Created by Luca Navarra on 05/04/23.
//

import Foundation
import SwiftUI


enum Tile{      //Element placed in a cell. It can be X, O or Empty
    
    case O
    case X
    case Empty
    
    
    
    var opposite : Tile {
        switch self {
        case .O:
            return.X
        case .X:
            return .O
        case .Empty:
            return .Empty
        }
        
    }
    
    
    
    /// Returns the color of the tile
    var tileColor : Color {
        
        switch self {
        case .O:
            return Color.blue
        case .X:
            return Color.red
        case .Empty:
            return Color.black
        }
    }
    
    
    
    /// Returns the String of the tile
    var tileString : String {
        switch self {
        case .O:
            return "O"
        case .X:
            return "X"
        case .Empty:
            return " "
        }
    }
    
    
    
}

