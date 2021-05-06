//
//  Order+Extension.swift
//  PizzaRestaurant
//
//  Created by vijayvir on 06/05/2021.
//

import Foundation
import CoreData
extension Order {
    
    var currentStatus : OrderStatusType {

        return OrderStatusType(rawValue: status ?? "") ?? .pending
    }
}
