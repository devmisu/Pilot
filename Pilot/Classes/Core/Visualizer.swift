//
//  Visualizer.swift
//  Pilot
//
//  Created by Felix Chacaltana on 15/03/22.
//

import Foundation
import UIKit

/*
 iOSKit
 Soporte para iOS (UIKit).
 */
struct Visualizer {
    
    func present() {
        
        guard let bundle = Bundle(identifier: "org.cocoapods.Pilot") else {
            fatalError("Error al instanciar el bundle.")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        guard let vc = storyboard.instantiateInitialViewController() else {
            fatalError("Error al instanciar el `MainViewController`.")
        }
        
        if #available(iOS 13.0, *) {
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first,
                  let rootVc = window.rootViewController
            else {
                fatalError("Error al obtener el `rootViewController`.")
            }
            
            rootVc.present(vc, animated: true, completion: nil)
            
        } else {
            
            guard let window = UIApplication.shared.windows.first,
                  let rootVc = window.rootViewController
            else {
                fatalError("Error al obtener el `rootViewController`.")
            }
            
            rootVc.present(vc, animated: true, completion: nil)
        }
    }
}
