//
//  Proxy.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation

/*
 Proxy
 Encargado de interceptar los request del app.
 */
final class Proxy: URLProtocol {
    
    var dataTask: URLSessionDataTask?
    
    override class func canInit(with request: URLRequest) -> Bool {
        
        if URLProtocol.property(forKey: "is_handled", in: request) as? Bool == true {
            return false
        }
        
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        let mutableRequest = (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.setProperty(true, forKey: "is_handled", in: mutableRequest)
        let newRequest = mutableRequest as URLRequest
        
        self.dataTask = URLSession.shared.dataTask(with: newRequest, completionHandler: { data, response, error in
            
            if let data = data, let response = response {
                
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                self.client?.urlProtocol(self, didLoad: data)
                
            } else if let error = error {
                
                self.client?.urlProtocol(self, didFailWithError: error)
            }
            
            self.client?.urlProtocolDidFinishLoading(self)
            
            let rq = Builder.build(with: self.dataTask, request: newRequest, data: data, response: response, error: error)
            Pilot.shared.storage.subscribe(rq)
        })
        
        self.dataTask?.resume()
    }
    
    override func stopLoading() {
        self.dataTask?.cancel()
    }
}
