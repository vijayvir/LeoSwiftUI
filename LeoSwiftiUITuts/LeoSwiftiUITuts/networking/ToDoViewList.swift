//
//  ToDoViewList.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct ToDoViewList: View {
   @StateObject var userTodoViewModel : UserTodoViewModel = UserTodoViewModel()
    var body: some View {
        
        NavigationView{
            VStack {
                List(){
                    ForEach(userTodoViewModel.toDos.value) { todo in
                        
                        HStack(alignment: .top, spacing: 20, content: {
                            Text(todo.title)
                                .foregroundColor(.blue)
                                .strikethrough(todo.completed, color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                .animation(.easeIn)
                            
                               
                        })
                    
                    }
                }
                .navigationTitle("Todos \(userTodoViewModel.toDos.value.count)")
                .listStyle(InsetGroupedListStyle())
                
                HStack(alignment: .center, spacing: 5, content: {
                    
                        Text("completedTasks \(userTodoViewModel.completedTasks.count)" as String)
                            
                            .padding(.vertical, 10.0)
                            .background(Color.red)
                    Text("non completedTasks \(userTodoViewModel.notCompletedTasks.count)" as String)
                        
                        .padding(.vertical, 10.0)
                        .background(Color.red)
                  
                })
            }
            
         
            
        }
        
  
    }
}

struct ToDoViewList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoViewList()
            .preferredColorScheme(.dark)
    }
}
