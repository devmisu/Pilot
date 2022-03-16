//
//  Color.swift
//  Pilot
//
//  Created by Felix Chacaltana on 16/03/22.
//

import Foundation
import UIKit

extension UIColor {
    
    private class func intFromHexString(_ hexString: String) -> UInt64 {
        
        var hexInt : UInt64 = 0
        
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet.init(charactersIn: "#")
        scanner.scanHexInt64(&hexInt)
        
        return hexInt
    }
    
    convenience init?(hex: String) {
        
        let hexint = UIColor.intFromHexString(hex)
        
        let red = CGFloat((hexint & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hexint & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
