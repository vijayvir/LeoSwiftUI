//
//  ShapeH.swift
//  ShapeH
//
//  Created by vijayvir on 10/05/2021.
//

import SwiftUI
struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 20.5, y: 34.5))
        
        path.addLine(to: CGPoint(x: 20.0, y: 89.5))
        path.addLine(to: CGPoint(x: 38.5, y: 89.5))
        path.addLine(to: CGPoint(x: 38.5, y: 71.5))
        path.addLine(to: CGPoint(x: 59.5, y: 71.5))
        path.addLine(to: CGPoint(x: 59.5, y: 89.5))
        
        path.addLine(to: CGPoint(x: 76.5, y: 89.5))
        path.addLine(to: CGPoint(x: 76.5, y: 34.5))
        path.addLine(to: CGPoint(x: 59.5, y: 34.5))
        path.addLine(to: CGPoint(x: 59.5, y: 55.5))
        path.addLine(to: CGPoint(x: 38.5, y: 55.5))
        
        path.addLine(to: CGPoint(x: 38.5, y: 34.5))
        path.addLine(to: CGPoint(x: 20.5, y: 34.5))
       
        
        return path
    }
}

struct ShrinkingSquares_Preview: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }}
