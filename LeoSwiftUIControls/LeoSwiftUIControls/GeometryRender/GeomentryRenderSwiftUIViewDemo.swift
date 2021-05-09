//
//  GeomentryRenderSwiftUIViewDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

struct GeomentryRenderSwiftUIViewDemo: View {
    var body: some View {
        GeometryReader { geometryProxy in
            VStack {
                HStack{
                    Text("\(geometryProxy.size.height/8)")
                }.frame(width: geometryProxy.size.width, height: geometryProxy.size.height/8, alignment: .center)
                .background(Color.red.opacity(0.5))
                
                Spacer()
                Text("\(geometryProxy.size.debugDescription)")
                Spacer()
                HStack{
                    ZStack {
                        Text("\(geometryProxy.size.height/8)")
                    }
                    .frame(width: geometryProxy.size.width, height: geometryProxy.size.height/8/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    
                }.frame(width: geometryProxy.size.width, height: geometryProxy.size.height/8, alignment: .center)
                .background(Color.red.opacity(0.5))
            }.ignoresSafeArea()
            
        }
    }
}

struct GeomentryRenderSwiftUIViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        GeomentryRenderSwiftUIViewDemo()
    }
}
