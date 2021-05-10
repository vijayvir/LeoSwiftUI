//
//  RestaurantDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by vijayvir on 09/05/2021.
//

import SwiftUI

enum ViewState {
    case full
    case half
}


struct RestaurantDetailView: View {
    
    @GestureState private var dragState : DragState = .inactive
    @State private var positionOffsetY : CGFloat = 0.0
    @State  private var viewState : ViewState = .half
    @State private var scrollOffset : CGFloat = 0.0
    @Binding var isShow : Bool
    let restaurant : Restaurant
    
    var body: some View {
        GeometryReader (content: { geometry in
            VStack{
                Spacer()
               
             

                HandleBar()
                
                ScrollView(.vertical, showsIndicators: true, content: {
                    
                    GeometryReader { scrollViewProxy in
                        Color.red.preference(key: ScrollOffsetKey.self, value: scrollViewProxy.frame(
                        in: .named("scrollview")).minY)
                       // Text("\(scrollViewProxy.frame(in: .named("scrollview")).minY)")
                    }
                    .frame(height: 0)
                    
                    
                 
                    
                    VStack {
                        TitleBar()
                        HeaderView(restaurant: restaurant)
                        DetailInfoView(icon: "map", info: restaurant.location)
                            .padding(.top)
                        DetailInfoView(icon: "phone", info: restaurant.phone)
                        DetailInfoView(icon: nil , info: restaurant.description)
                            .padding(.top)
                            .padding(.bottom , 100)
                    }
                    .offset(y : -self.scrollOffset)
                    .animation(nil)
                    
                    
                })
                .background(Color.white)
                .cornerRadius(10, antialiased: true )
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
          
            }
            .offset( y: geometry.size.height/2 + self.dragState.translation.height + positionOffsetY)
            // work over here to make the screen full scale or half
            .edgesIgnoringSafeArea(.all)
            .animation(.linear)
            .offset(y: self.scrollOffset)
            .gesture(
                DragGesture()
                    .updating(self.$dragState, body: { (currentValueOfGesture, state, transaction) in
                        
                        state = .dragging(translation: currentValueOfGesture.translation)
                    })
                    .onEnded({ value in
                        //Threshhold
                        /*
                         Slide up and when it goes beyond the threshold
                         // change the viewState to fully opneded by uodating
                         // the position offset
                         
                         */
                        if value.translation.height < -geometry.size.height * 0.25 {
                            self.positionOffsetY = -geometry.size.height/2 + 50
                            self.viewState = .full
                        }
                        if value.translation.height > geometry.size.height * 0.3 {
                        self.isShow = false
                            
                        }
                        
                    })
            
            )
            .onPreferenceChange(ScrollOffsetKey.self, perform: { value in
                print("******" , value )
                self.scrollOffset = value>0 ? value : 0
                
                if self.scrollOffset > 120 {
                    self.positionOffsetY = 0
                    self.viewState = .half
                    self.scrollOffset = 0
                    
                }
                
            })
        })
        
     
      
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
            .padding(.vertical ,10)
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            RestaurantDetailView(isShow: .constant(true), restaurant: restaurants[0])
           // HandleBar().previewLayout(.sizeThatFits)
          //  TitleBar().previewLayout(.sizeThatFits)
           // HeaderView(restaurant: restaurants[0]).previewLayout(.sizeThatFits)
         
        }
        
    }
}
struct TitleBar : View {
    var body : some View {
      
        HStack {
            Text("Restaurant Details")
            .font(.headline)
            .foregroundColor(.primary)
          Spacer()
        }
        .padding()
    }
}

struct HeaderView :View {
    var restaurant : Restaurant
    
    var body : some View {
        
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame( height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Spacer()
                        Text(restaurant.name)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Text(restaurant.type)
                            .padding(5)
                            .background(Color.red)
                         
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    })
                    //.background(Color.yellow)
                    .padding()
                    Spacer()
                    
                }
            
            )
    }
}

struct DetailInfoView : View {
    let icon : String?
    let info : String
    
    var body : some View{
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing , 10)
                 
            }
            
            Text(info)
                .font(.system(.body, design : .rounded))
            Spacer()
        }.padding(.horizontal)
        
    }
}

struct ScrollOffsetKey : PreferenceKey {
    
    typealias Value = CGFloat

    /// The default value of the preference.
    ///
    /// Views that have no explicit value for the key produce this default
    /// value. Combining child views may remove an implicit value produced by
    /// using the default. This means that `reduce(value: &x, nextValue:
    /// {defaultValue})` shouldn't change the meaning of `x`.
    static var defaultValue = CGFloat.zero

    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// This method receives its values in view-tree order. Conceptually, this
    /// combines the preference value from one tree with that of its next
    /// sibling.
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    static func reduce(value: inout Value, nextValue: () -> Value) {
        
        value += nextValue()
    }
    
}
