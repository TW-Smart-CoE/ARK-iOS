//
//  Appdelegate.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeCoordinator()
        let homeVC = ExampleHomeViewController()
        home.addChild(homeVC)
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()
        return true
    }
}

