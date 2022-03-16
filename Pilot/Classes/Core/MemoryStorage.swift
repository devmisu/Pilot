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
    
    func subscribe(_ request: Request) {
        self.requests.append(request)
    }
    
    func fetchRequests(_ search: String) -> [Request] {
        
        let str = search.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if str == "" { return self.requests }
        return self.requests.filter({ $0.path.contains(str) })
    }
}
