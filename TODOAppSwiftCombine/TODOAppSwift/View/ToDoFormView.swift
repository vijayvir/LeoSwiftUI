//
//  ToDoFormView.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore : DataStore
    @ObservedObject var formVM : ToFormViewModel
    @Environment(\.presentationMode) var presetationMode
    
    var body: some View {
        NavigationView{
            Form {
                VStack(alignment: .leading){
                    TextField("Todo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                    
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
      
  
    }
}


extension ToDoFormView {
    
    var cancelButton : some View {
        Button("Cancel") {
            presetationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton : some View {
        
        Button(formVM.updating ? "Update" : "Save") {
            if formVM.updating{
                updateToDo()
            }else {
                addToDo()
            }
        }.disabled(formVM.isDisable)
        
    }
    
    func updateToDo(){
        let todo = ToDo(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        dataStore.updateToDo(todo)
        presetationMode.wrappedValue.dismiss()
    }
    func addToDo(){
        let newToDo = ToDo(name: formVM.name)
        dataStore.addToDo(newToDo)
        presetationMode.wrappedValue.dismiss()
    }
    
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView( formVM: ToFormViewModel()).environmentObject(DataStore())
    }
}
