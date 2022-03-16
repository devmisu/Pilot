//
//  ViewController.swift
//  Pilot
//
//  Created by devmisu on 03/15/2022.
//  Copyright (c) 2022 devmisu. All rights reserved.
//

import UIKit
import Pilot

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://httpbin.org/json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.httpBody = try? JSONSerialization.data(withJSONObject: [ "hello": "world" ], options: [])
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, let str = String(data: data, encoding: .utf8) else { return }
            print(str)
        }).resume()
    }
}

