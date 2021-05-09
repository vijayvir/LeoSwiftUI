//
//  CustomTabBarVM.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 07/05/2021.
//

import Foundation
import Combine

class CustomTabBarVM : ObservableObject {
    
    @Published var currentSelectedTab : TabBarIconType = .home
    
}
