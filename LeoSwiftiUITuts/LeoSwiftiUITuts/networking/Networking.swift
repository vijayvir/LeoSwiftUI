//
//  Networking.swift
//  LeoSwiftiUITuts
//
//  Created by vijayvir on 05/05/2021.
//

import Foundation
import Combine

struct Constant {
    
    static let url : String = "https://jsonplaceholder.typicode.com/todos"
}


// Its recommended to make the protocol structure to know what class actually needed

protocol NetworkMangerProtocol : class { // only for the classes
    
    func get<T> (type: T.Type ,url : URL) -> AnyPublisher<T,Error> where T : Decodable
}

class NetworkManger : NetworkMangerProtocol {
    func get<T>(type: T.Type, url: URL) -> AnyPublisher<T, Error> where T : Decodable {
     
        return     URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ (arg0) -> Data in
                
                let (data, response) = arg0
                print(data, response)
                print("*********************",String(data: data, encoding: String.Encoding.utf8))
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
     
        
    }
    
    
}
