//
//  UISampleApp.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

@main
struct UISampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
