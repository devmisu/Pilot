//
//  Enums.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

enum Method: String {
    case get = "GET", post = "POST", put = "PUT", delete = "DELETE"
}

enum StatusCode: Int {
    case Ok = 200
    case MultipleChoices = 300
    case BadRequest = 400
    case InternalServerError = 500
    
    var color: String {
        switch self.rawValue {
        case 200..<300: return "#69AEA4"
        case 300..<400: return "#DCC25E"
        case 400..<500: return "#DE8E49"
        case 500..<600: return "#BA4072"
        default: return ""
        }
    }
    
    var message: String {
        switch self {
        case .Ok: return "Ok"
        case .MultipleChoices: return "Multiple Choices"
        case .BadRequest: return "Bad Request"
        case .InternalServerError: return "Internal Server Error"
        }
    }
}
