//
//  MainViewController.swift
//  Pilot
//
//  Created by Felix Chacaltana on 15/03/22.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? RequestViewController {
            controller.request = sender as? Request
        }
    }
}

// MARK: - Actions

extension MainViewController {
    
    @IBAction private func syncData(_ sender: UIButton) {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pilot.shared.storage.requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableViewCell", for: indexPath) as! RequestTableViewCell
        
        let request = Pilot.shared.storage.requests[indexPath.row]
        cell.populateCell(request)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let request = Pilot.shared.storage.requests[indexPath.row]
        self.performSegue(withIdentifier: "RequestViewController", sender: request)
    }
}
