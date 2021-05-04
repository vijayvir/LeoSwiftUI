//
//  ContentView.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore : DataStore
    @State private var modalType : ModelType? = nil
    var body: some View {
        NavigationView {
            List(){
             
                ForEach (dataStore.toDos){ todo in
                 
                    Button(action: {
                        modalType = .update(todo)
                    }, label: {
                        Text(todo.name)
                            .font(.title3)
                            .strikethrough(todo.completed)
                            .foregroundColor(todo.completed ? .green : Color(.label))
                        
                    })
                
                }.onDelete(perform: { indexSet in
                    dataStore.delete(at: indexSet)
                })
                    
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                
                ToolbarItem(placement: ToolbarItemPlacement.principal) {
                    Text("My Todos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: {
                        modalType = .new
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
                
            })
            
                
              
            }
        .sheet(item: $modalType) { modalType in
            modalType
        }
      
        .alert(item: $dataStore.appError) { (typeError) -> Alert in
            
           return Alert(title: Text("OH Oh"), message: Text(typeError.error.localizedDescription)
            )
        }
        }
        

    }






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DataStore())
    }
}

