//
//  OrderListViewModel.swift
//  PizzaRestaurant
//
//  Created by vijayvir on 06/05/2021.
//
import UIKit
import Foundation
import CoreData
import SwiftUI
import Combine
class OrderListViewModel : NSObject , ObservableObject  {
    
    // context is accessed from the shared instance but not from the enviorment variable as it did in the ContentView Class
    let context : NSManagedObjectContext =  PersistenceController.shared.container.viewContext
    
    // it the pubblisher pubject which will get values and broadcast to the swiftui View
    var orders = CurrentValueSubject<[Order],Never>([])
 
    // This property is made to get the fetch objects and assign to the current publisher
    
    private let orderFetchController : NSFetchedResultsController<Order>
    
    
     override init(){
  

        let fetchRequest : NSFetchRequest = Order.fetchRequest()
        fetchRequest.sortDescriptors =  []
        orderFetchController = NSFetchedResultsController(fetchRequest: fetchRequest , managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        orderFetchController.delegate = self
        do {
            try   orderFetchController.performFetch()
            // Values are given to the current subject
            orders.value = orderFetchController.fetchedObjects ?? []
            
            
        } catch let error  {
            print(error)
            
        }
    }
    
    func delete(indexSet: IndexSet){
        
        
        self.objectWillChange.send()
        
        
        for offset in indexSet {
            let order = self.orders.value[offset]
            context.delete(order)
        }

        saveContext()
    }
    
    func saveContext(){
        do {
            try context.save()
            

        } catch let error{
            print("error" , error)
        }
    }
    
    func updateStatus( newStatus: OrderStatusType , order : Order) {
           context.performAndWait {
            order.status = newStatus.rawValue
                saveContext()
            }
    }
    
    func addOrder(pizzaType: PizzaType  , numberOfSlices : Int , tableNumber : String , completion : (Result<Bool , Error>) -> () ){
         
        let order = Order(context: context)
        
        order.pizzaType = pizzaType.rawValue
        
        order.tableNumber = tableNumber
       
        order.status = OrderStatusType.pending.rawValue
        
        order.numberOfslices = Int16(numberOfSlices)
        order.id = UUID()
          
        do {
            try context.save()
            completion(.success(true))

        } catch let error{
            completion(.failure(error))
        }

    }
}
extension OrderListViewModel : NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let orders = controller.fetchedObjects as? [Order] else {
            return
        }
        print("Context has chnaged , reloading cources🐸 ")
        self.objectWillChange.send()
        self.orders.value = orders
    }
}
