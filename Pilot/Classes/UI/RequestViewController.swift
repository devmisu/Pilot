//
//  RequestViewController.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import UIKit

final class RequestViewController: UIViewController {

    @IBOutlet private weak var lblSendBytes: UILabel!
    @IBOutlet private weak var lblReceivedBytes: UILabel!
    @IBOutlet private weak var lblUrl: UILabel!
    @IBOutlet private weak var lblMethod: UILabel!
    @IBOutlet private weak var lblStatus: UILabel!
    @IBOutlet private weak var lblResponse: UILabel!
    @IBOutlet private weak var lblRawData: UILabel!
    @IBOutlet private var stackViews: [UIStackView]!
    
    // MARK: - Properties
    
    var request: Request!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStackView(0)
        self.title = request.path
        
        // Overview
        self.lblSendBytes.text = self.request.sendBytes
        self.lblReceivedBytes.text = self.request.receivedBytes
        self.lblUrl.text = self.request.url
        self.lblMethod.text = self.request.method.rawValue
        self.lblStatus.text = self.request.statusCode.message
        self.lblResponse.text = "\(self.request.statusCode.rawValue)"
        
        // Request
        
        // Response
        self.lblRawData.text = self.request.response.rawData
    }
    
    // MARK: - Actions
    
    @IBAction private func tapSegmentedControl(_ sender: UISegmentedControl) {
        self.setStackView(sender.selectedSegmentIndex)
    }
    
    // MARK: - Methods
    
    private func setStackView(_ index: Int ) {
        if !(0..<self.stackViews.count).contains(index) { return }
        
        self.stackViews.enumerated().forEach { i, e in
            e.isHidden = (i != index)
        }
    }
}
