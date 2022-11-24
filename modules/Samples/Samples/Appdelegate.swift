//
//  Appdelegate.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//  swiftlint:disable line_length

import Foundation
import UIKit
import Core
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Samples.homePage()
        window?.makeKeyAndVisible()
        return true
    }
}
