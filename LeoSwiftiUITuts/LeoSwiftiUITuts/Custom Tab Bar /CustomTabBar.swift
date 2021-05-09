//
//  CustomTabBar.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 07/05/2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    @ObservedObject var  customTabVm : CustomTabBarVM
    @State var showPopUp :Bool = false
    var body: some View {
        
      
        GeometryReader(content: { geometry in
          
            
            VStack  {
                    Spacer()
                    Text("Screen name")
                    Spacer()
                
                ZStack {
                   
                   if showPopUp {
                       PlusMenu(widthAndHeight: geometry.size.width/7)
                           .offset(y: -geometry.size.height/6)
                   }
                   
                    HStack(content: {
                      
                        TapBarIcon(customTabVm: customTabVm,  configurations: TabConfigure(height: geometry.size.height * 0.04 ,width: geometry.size.width/5,
                                                                iconName: TabBarIconType.home.icon,
                                                                iconTitle: TabBarIconType.home.title, type: TabBarIconType.home))
                        TapBarIcon(customTabVm: customTabVm,configurations: TabConfigure(height: geometry.size.height * 0.04 ,width: geometry.size.width/5,
                                                                iconName: TabBarIconType.liked.icon,
                                                                iconTitle: TabBarIconType.liked.title, type: TabBarIconType.home))
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                .foregroundColor(Color.pink)
                                .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                        }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                        
                        TapBarIcon(customTabVm: customTabVm,configurations: TabConfigure(height: geometry.size.height * 0.04 ,width: geometry.size.width/5,
                                                                iconName: TabBarIconType.users.icon,
                                                                iconTitle: TabBarIconType.users.title, type: TabBarIconType.home))
                        TapBarIcon(customTabVm: customTabVm,configurations: TabConfigure(height: geometry.size.height * 0.04 ,width: geometry.size.width/5,
                                                                iconName: TabBarIconType.setting.icon,
                                                                iconTitle: TabBarIconType.setting.title, type: TabBarIconType.home))
                        
                    })
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.10, alignment: .center)
                    .background(Color.gray.opacity(0.5))
               }
                
           
            }
            
        })
        
  

        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTabBar(customTabVm: CustomTabBarVM())
       
        }
    }
}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
           .transition(.scale)
    }
}
