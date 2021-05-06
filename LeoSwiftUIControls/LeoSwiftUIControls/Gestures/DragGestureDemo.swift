//
//  DragGestureDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct DragGestureDemo: View {
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    @State var predictedEndLocation: CGPoint = .zero
    var body: some View {
        VStack {
            
            Circle()
                .fill(Color.blue)
                .frame(width:10 , height: 10, alignment: .center)
                .offset(CGSize(width: predictedEndLocation.x, height: predictedEndLocation.y))
             Circle()
                .frame(width: 100, height: 50, alignment: .center)
                .offset(x: dragOffset.width + position.width, y: dragOffset.height + position.height)
                .gesture(
                    DragGesture(minimumDistance: 5, coordinateSpace:CoordinateSpace.local)
                        .onChanged({ (value) in
                            print("onChanged  location " ,value.location)
                            predictedEndLocation = value.location
                            self.dragOffset = value.translation
                        })
                        .onEnded({ (value) in
                            print("onEnded " ,value)
                            self.position.width += value.translation.width
                            self.position.height += value.translation.height
                            self.dragOffset = .zero
                           // self.predictedEndLocation  = .zero
                        })
                )
            Text("Hello, World!")
        }
    }
}

struct DragGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureDemo()
    }
}
