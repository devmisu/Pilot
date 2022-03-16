//
//  Builder.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

struct Builder {
    
    private init() {
        
    }
    
    static func build(with dataTask: URLSessionDataTask?, request: URLRequest, data: Data?, response: URLResponse?, error: Error?) -> Request {
        
        // Parse data
        let url = request.url?.absoluteString ?? ""
        let httpMethod = request.httpMethod ?? ""
        let method = Method(rawValue: httpMethod) ?? .get
        let httpResponse = (response as? HTTPURLResponse) ?? HTTPURLResponse()
        let statusCode = StatusCode(rawValue: httpResponse.statusCode) ?? .Ok
        let rawData = String(data: data ?? Data(), encoding: .utf8) ?? ""
        let sendBytes = dataTask?.countOfBytesSent ?? 0
        let receivedBytes = dataTask?.countOfBytesReceived ?? 0
        let sendBytesFormatted = ByteCountFormatter.string(fromByteCount: sendBytes, countStyle: .memory)
        let receivedBytesFormatted = ByteCountFormatter.string(fromByteCount: receivedBytes, countStyle: .memory)
        
        // Create objects
        let objResponse = Response(rawData: rawData)
        
        return Request(url: url,
                       method: method,
                       statusCode: statusCode,
                       sendBytes: sendBytesFormatted,
                       receivedBytes: receivedBytesFormatted,
                       response: objResponse)
    }
}
