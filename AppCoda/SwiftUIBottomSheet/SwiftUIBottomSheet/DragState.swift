//
//  DragState.swift
//  SwiftUIBottomSheet
//
//  Created by vijayvir on 10/05/2021.
//


import Foundation
import SwiftUI
enum DragState {
    case inactive
    case pressing
    case dragging(translation : CGSize)
    
    var translation : CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
    
        case .dragging(translation: let translation ):
            return translation
        }
    }
    
    var isPressing : Bool {
        
        switch self {
        case .inactive:
            return false
        case .pressing, .dragging:
            return true
      
        }
    }
}
