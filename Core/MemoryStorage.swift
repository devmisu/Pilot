//
//  MemoryStorage.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

/*
 MemoryStorage
 Almacenamiento en memoria.
 */
final class MemoryStorage: Storage {
    
    var requests: [Request]! = [Request]()
    
    func subscribe(_ request: URLRequest, data: Data?, response: URLResponse?, error: Error?) {
        
        guard let url = request.url?.absoluteString,
              let httpMethod = request.httpMethod,
              let method = Method(rawValue: httpMethod),
              let httpResponse = response as? HTTPURLResponse,
              let statusCode = StatusCode(rawValue: httpResponse.statusCode),
              let data = data,
              let rawData = String(data: data, encoding: .utf8)
        else {
            return
        }
        
        let newRequest = Request(url: url,
                                 method: method,
                                 statusCode: statusCode,
                                 response: Response(rawData: rawData))
        
        self.requests.append(newRequest)
    }
}
