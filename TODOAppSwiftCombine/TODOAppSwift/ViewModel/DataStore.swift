//
//  DataStore.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import Foundation
import Combine

class DataStore : ObservableObject {
    
    //@Published var toDos : [ToDo] = []
    
    var toDos = CurrentValueSubject<[ToDo],Never>([])
    
    // @Published var appError : ErrorType? = nil
    var appError = CurrentValueSubject<ErrorType?,Never>(nil)
    
    var subscription = Set<AnyCancellable>()
    var addToDo = PassthroughSubject<ToDo, Never>()
    
    var updateTodo = PassthroughSubject<ToDo, Never>()
    var deleteToDo = PassthroughSubject<IndexSet , Never> ()
    var loadToDo = Just(FileManager.docDirUrl.appendingPathComponent(fileName))
    init(){
        addsubscriptions()
        print(FileManager.docDirUrl,FileManager().isDocExist(named: fileName))

    }
    
    func addsubscriptions() {
        
        appError
            .sink { (error) in
                self.objectWillChange.send()
            }.store(in: &subscription)
        
        loadToDo
            .filter { (url) -> Bool in
                return FileManager.default.fileExists(atPath: url.path)
            }
            .tryMap({ (url) -> Data in
                try Data(contentsOf: url)
            })
            .decode(type: [ToDo].self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue(label: "backGround Quiue"))
            .receive(on: DispatchQueue.main)
            .sink { [unowned self](completion) in
                switch completion {
                
                case .finished:
                    print("Loading")
                    toDoSubscriptions()
                case .failure(let error):
                    if error is ToDoError {
                        appError.send(ErrorType(error: error as! ToDoError))
                        //appError = ErrorType(error: error as! ToDoError)
                    }else {
                        appError.send(ErrorType(error: .decordingError))
                       // appError = ErrorType(error: .decordingError)
                        toDoSubscriptions()
                    }
                }
            } receiveValue: {[unowned self] (todos) in
                self.objectWillChange.send()
                self.toDos.value = todos
                
            }
            .store(in: &subscription)

        


        
        addToDo
            .sink {[unowned self] todo in
                self.objectWillChange.send()
                self.toDos.value.append(todo)
      
        }
            .store(in: &subscription)
        
        
        updateTodo
            .sink {[unowned self] toDo in
            guard let index = self.toDos.value.firstIndex(where: { (todoLocal) -> Bool in
                return toDo.id == todoLocal.id
            }) else {
                return
            }
                self.objectWillChange.send()
                self.toDos.value[index] = toDo
       
        }
            .store(in: &subscription)
        
        deleteToDo.sink { [unowned self] indexSet in
            self.objectWillChange.send()
            self.toDos.value.remove(atOffsets: indexSet)
        
        }.store(in: &subscription)
        
        
    }

    func toDoSubscriptions(){
        
        
        toDos
            .subscribe(on: DispatchQueue(label: "backGround Quiue"))
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .encode(encoder: JSONEncoder())
            .tryMap { data in
                
                try data.write(to: FileManager.docDirUrl.appendingPathComponent(fileName))
            }.sink {[unowned self] (completion) in
                switch completion {
                
                case .finished:
                    print("Saving the Docs")
                case .failure(let error):
                    if error is ToDoError{
                        appError.send(ErrorType(error: error as! ToDoError))
                        //self.appError = ErrorType(error: error as! ToDoError)
                    }else {
                        
                        appError.send(ErrorType(error: .encordingError))
                        
                       // self.appError = ErrorType(error: .encordingError)
                    }
                    
                    print(error.localizedDescription)
                }
            } receiveValue: { _ in
                print("Save to disk")
            }.store(in: &subscription)
    }

}










































