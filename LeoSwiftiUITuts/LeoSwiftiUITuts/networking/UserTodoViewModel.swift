//
//  UserTodoViewModel.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//
import Combine
import Foundation


class  UserTodoViewModel: ObservableObject {

    var networkManager : NetworkManger = NetworkManger()
    var subscriptions = Set<AnyCancellable>()
    var toDos = CurrentValueSubject<[TodosModel.Todo],Never>([])
    var completedTasks : [TodosModel.Todo] {
        
        return toDos.value.filter { (todo) -> Bool in
            return todo.completed
        }
    }
    var notCompletedTasks : [TodosModel.Todo] {
        
        return toDos.value.filter { (todo) -> Bool in
            return !todo.completed
        }
    }
    init() {
        addSubscriptions()
    }
    
    func addSubscriptions(){
        
        toDos.sink { (values) in
            print(values)
        }.store(in: &subscriptions)
        
        
        if let url = URL(string: Constant.url ) {
          networkManager.get(type: [TodosModel.Todo].self, url:url)
                .subscribe(on: DispatchQueue(label: "backGround Quiue"))
                .receive(on: DispatchQueue.main)
                .sink { (completion) in
                    print(completion)
                } receiveValue: { (value) in
               
                    self.objectWillChange.send()
                    self.toDos.send(value)
                }.store(in: &subscriptions)

        }
    
        
    }
    
}

