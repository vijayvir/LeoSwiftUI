//
//  PizzaRestaurantApp.swift
//  PizzaRestaurant
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI

@main
struct PizzaRestaurantApp: App {
   
    var body: some Scene {
        WindowGroup {
            
            OrderListView()
                .environmentObject(OrderListViewModel())
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
