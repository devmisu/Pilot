//
//  Request.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

struct Request {
    var url: String
    var method: Method
    var statusCode: StatusCode
    var response: Response
}

struct Response {
    var rawData: String
}
