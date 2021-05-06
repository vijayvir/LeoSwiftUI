//
//  OrderListView.swift
//  PizzaRestaurant
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI
import CoreData

struct OrderListView: View {
    @State var isPresentSheet : Bool = false
    @EnvironmentObject var orderListVM : OrderListViewModel
    var body: some View {
        
        NavigationView(content: {
            
            List(){
                
                ForEach(orderListVM.orders.value) { order in
                      HStack {
                          VStack(alignment: .leading) {
                            Text("\(order.pizzaType ?? "") - \(order.numberOfslices) slices")
                                  .font(.headline)
                                .strikethrough(order.currentStatus == .completed , color: Color.black)
                            
                            Text("Table \(order.tableNumber ?? "")")
                                  .font(.subheadline)
                          }
                          Spacer()
                          Button(action: {
                            self.updateOrder(order: order)
                                        
                                    }
                          ) {
                            Text(order.currentStatus == .pending ? OrderStatusType.preparing.rawValue : OrderStatusType.completed.rawValue)
                                  .foregroundColor(.blue)
                          }
                      }
                      .frame(height: 50)
                }.onDelete(perform: { indexSet in
                    orderListVM.delete(indexSet: indexSet)
                })
                    
            }
            .listStyle(PlainListStyle())
            .navigationTitle("My Orders")
            .navigationBarItems(leading: EditButton() ,trailing:
                                    Button(action: {
                                     
                                        self.isPresentSheet.toggle()
                                        print("SomeThingIsTypeHere")
                                    }, label: {
                                        Image(systemName: "plus.circle")
                                    }))
            .sheet(isPresented: $isPresentSheet, content: {
                OrderDetailView().environmentObject(orderListVM)
            })
        })
  
    }
    func updateOrder(order: Order) {
            let newStatus = order.currentStatus == .pending ? OrderStatusType.preparing : .completed
              orderListVM.updateStatus(newStatus: newStatus, order: order)
        }
}



struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
