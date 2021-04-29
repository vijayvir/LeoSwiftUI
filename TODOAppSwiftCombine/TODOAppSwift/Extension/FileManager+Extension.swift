//
//  FileManager+Extension.swift
//  TODOAppSwift
//
//  Created by vijayvir on 29/04/2021.
//

import Foundation

let fileName = "ToDos.json"
extension FileManager {
    static var docDirUrl : URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    func saveDocument(contents : String ,docName: String , completion : (ToDoError) -> Void){
        
        let url = Self.docDirUrl.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        }catch{
            completion(.saveError)
        }
        
    }
    func readDocument(docName: String , completion : (Result<Data,ToDoError>) -> Void ){
        let url = Self.docDirUrl.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        }catch {
            completion(.failure(.readError))
        }
    }
    func isDocExist(named docName : String) -> Bool {
        fileExists(atPath: Self.docDirUrl.appendingPathComponent(docName).path)
    }
}






















