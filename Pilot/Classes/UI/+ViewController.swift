//
//  +ViewController.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        
        if motion == .motionShake { Pilot.shared.visualizer.present() }
    }
}
