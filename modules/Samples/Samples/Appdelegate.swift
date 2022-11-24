//
//  Appdelegate.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
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
        let envvironment = EnvironmentConfiguration.development
        let repository = StandardNetworkRepository(service: envvironment.apiService)
        let homeDependency = StandardHomeDependency(networkRepository: repository)
        let home = HomeCoordinator(dependency: homeDependency)
        let exampleViewModel = HomeViewModel(navigator: home)
        let homeVC = HomeViewController(viewModel: exampleViewModel)
        home.addChild(homeVC)
        window?.rootViewController = home
        window?.makeKeyAndVisible()
        return true
    }
}
