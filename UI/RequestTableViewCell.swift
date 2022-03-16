//
//  RequestTableViewCell.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import UIKit

final class RequestTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblStatusCode: UILabel!
    @IBOutlet private weak var lblURL: UILabel!
    @IBOutlet private weak var lblMethod: UILabel!
    
    // MARK: - Methods
    
    func populateCell(_ request: Request) {
        self.lblStatusCode.text = "\(request.statusCode.rawValue)"
        self.lblStatusCode.textColor = UIColor(hex: request.statusCode.color)
        self.lblURL.text = request.url
        self.lblMethod.text = request.method.rawValue
    }
}
