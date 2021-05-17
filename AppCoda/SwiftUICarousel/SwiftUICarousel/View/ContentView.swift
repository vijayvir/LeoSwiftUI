//
//  ContentView.swift
//  SwiftUICarousel
//
//  Created by Simon Ng on 27/8/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isCardTapped = false
    
    var body: some View {
    
    
        GeometryReader(content: { outerView  in
            
            HStack (alignment: .center, spacing: nil, content: {
                
                ForEach(sampleTrips.indices) { index in
                    GeometryReader (content: { innerView in
                        
                        TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
                        
                        
                    })
                    .padding(.horizontal , self.isCardTapped ? 0 : 20 )
                    .frame(width : outerView.size.width , height : 450)
                }
                
                
            }).background(Color.red)
            .frame(width : outerView.size.width , height : outerView.size.height , alignment:.leading)
            
        })
        
        
        
        /*
        GeometryReader(content: { outerView  in
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack (alignment: .center, spacing: nil, content: {
                    
                    ForEach(sampleTrips.indices) { index in
                        GeometryReader (content: { innerView in
                            
                            TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
                            
                            
                        })
                        .padding(.horizontal , 20 )
                        .frame(width : outerView.size.width , height : 450)
                    }
                    
                    
                }).background(Color.red)
                
            })
            .frame(width : outerView.size.width , height : outerView.size.height, alignment: .leading)
            
            
        })
    
    */
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
