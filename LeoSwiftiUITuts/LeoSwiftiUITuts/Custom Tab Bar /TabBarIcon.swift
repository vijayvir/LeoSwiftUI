//
//  TabBarIcon.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 07/05/2021.
//
import SwiftUI
import Foundation


struct TabConfigure {
    var height : CGFloat
    var width : CGFloat
    var iconName : String
    var iconTitle : String
    var type : TabBarIconType
}
enum TabBarIconType {
    case home
    case liked
    case records
    case users
    case setting
    
    var icon : String {
        switch self {
        case .home:
            return "house"
        case .liked:
            return "hand.thumbsup"
        case .records:
            return "recordingtape"
        case .users:
            return "person"
        case .setting:
            return "pencil"
        }
    }
    
    var title : String {
        switch self {
        case .home:
            return "Home"
        case .liked:
            return "Like"
        case .records:
            return "Record"
        case .users:
            return "User"
        case .setting:
            return "Setting"
        }
    }
    
}


struct TapBarIcon : View {
    @ObservedObject var  customTabVm : CustomTabBarVM

    var configurations : TabConfigure
    
    var body: some View {
    
        VStack(alignment: .center, spacing: nil, content: {
        
            Image(systemName: configurations.iconName)
            
                .resizable()
                
                .aspectRatio(contentMode: .fit)
                
                .frame(width: configurations.width,
                
                       height: configurations.height,
                       
                       alignment: .center)
                .padding(.top, 10)
            Text(configurations.iconTitle)
                .font(.footnote)
        })
        .foregroundColor(customTabVm.currentSelectedTab == configurations.type ? .blue : .gray)
        .padding(.horizontal, -8)
        .onTapGesture {
            customTabVm.currentSelectedTab = configurations.type
        }
    }
}
