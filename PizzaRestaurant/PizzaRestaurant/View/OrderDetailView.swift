//
//  OrderDetailView.swift
//  PizzaRestaurant
//
//  Created by vijayvir on 06/05/2021.
//

import SwiftUI


struct OrderDetailView: View {
    var allPizza : [PizzaType] = PizzaType.allCases
    @EnvironmentObject var orderListVM : OrderListViewModel
    @State var numberOfSlices = 1
    @State private var selectedPizzaType = PizzaType.PizzaMargherita
    @State var tableNumber  : String = ""
    @State var isShowAlert : Bool = false
    @Environment(\.presentationMode) var presetationMode
    var body: some View {
       
        NavigationView {
            Form {
                Section(header: Text("Pizza Details")) {
                    
                    HStack {
                        Picker("Pizza Type", selection: $selectedPizzaType) {
                            ForEach(allPizza, id: \.self) { value in
                                Text("\(value.rawValue)")
                                
                            }
                            
                        }
                        
                    }
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                
                Section(header: Text("TABLE")) {
                    
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.decimalPad)
                    
                }
                
                Button(action: {
                    self.addOrder()
                }, label: {
                    Text("Add Order")
                })
            }
            .navigationBarTitle("Order")
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("Please enter the Table number"))
            })
        }
        
    }
    
    func addOrder() {
  
        hideKeyboard()
        if tableNumber.isEmpty {
            isShowAlert = true
            return
        }
        orderListVM.addOrder(pizzaType: selectedPizzaType, numberOfSlices: numberOfSlices, tableNumber: tableNumber) { result in
            
            switch result {
            
            case .success(_):
                presetationMode.wrappedValue.dismiss()
            case .failure(let error ):
               print("Erroe \(error)")
            }
            
        }
        //presetationMode.wrappedValue.dismiss()
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}

