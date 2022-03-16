//
//  Storage.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

/*
 Storage
 Almacena los requests para su uso posterior.
 */
protocol Storage {
    var requests: [Request]! { get }
    func subscribe(_ request: Request)
    func fetchRequests(_ search: String) -> [Request]
}
