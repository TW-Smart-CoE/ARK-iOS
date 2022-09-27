//
//  AppDelegate.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import UI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // 使用Typography时，需要在应用启动时先调用Font.registerFonts()
        Font.registerFonts()
        return true
    }
}
