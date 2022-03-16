//
//  Pilot.swift
//  Pilot
//
//  Created by Felix Chacaltana on 15/03/22.
//

import Foundation

public struct Pilot {
    
    public static let shared = Pilot()
    
    var storage: Storage!
    var visualizer: Visualizer!
    
    private init() {
        self.storage = MemoryStorage()
        self.visualizer = Visualizer()
    }
    
    public func configure() {
        URLProtocol.registerClass(Proxy.self)
    }
}
