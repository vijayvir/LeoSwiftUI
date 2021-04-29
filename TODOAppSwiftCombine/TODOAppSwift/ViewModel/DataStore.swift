//
//  DataStore.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import Foundation
class DataStore : ObservableObject {
    
    @Published var toDos : [ToDo] = []
    @Published var appError : ErrorType? = nil
    init(){
        print(FileManager.docDirUrl,FileManager().isDocExist(named: fileName))
        
        if FileManager().isDocExist(named: fileName){
            loadToDo()
        }
        
   
    }
    func addToDo(_ toDo: ToDo ) {
        toDos.append(toDo)
        saveToDos()
    }
    
    func updateToDo(_ toDo : ToDo) {
        guard let index = toDos.firstIndex(where: { (todoLocal) -> Bool in
            return toDo.id == todoLocal.id
        }) else {
            return
        }
        toDos[index] = toDo
        saveToDos()
    }
    func delete(at indexSet : IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveToDos()
    }
    func loadToDo(){
        
       // toDos = ToDo.sampleData
        FileManager().readDocument(docName: fileName) { (r) in
            switch r {
            
            case .success(let data):
                let decorder = JSONDecoder()
                do{
                    toDos = try decorder.decode([ToDo].self, from: data)
                    
                }catch {
                    print(error.localizedDescription)
                    appError = ErrorType(error: .decordingError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                appError = ErrorType(error: error)
            }
        }
    
    }
    func saveToDos(){
        print("Saved Todo to file System")
        let encorder = JSONEncoder()
        
        do {
            let data = try encorder.encode(toDos)
            
            let jsonString = String(decoding: data, as:  UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                print(error.localizedDescription)
                appError = ErrorType(error:error)
            }
            
            
        }catch{
            print(error.localizedDescription)
            appError = ErrorType(error:.encordingError)
        }
        
    }
}










































