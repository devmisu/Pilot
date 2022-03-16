//
//  RequestViewController.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import UIKit

final class RequestViewController: UIViewController {

    @IBOutlet private weak var lblData: UILabel!
    
    // MARK: - Properties
    
    var request: Request!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = request.url
        self.lblData.text = self.request.response.rawData
    }
}
