//
//  ARKApp.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import Combine

@main
struct ARKApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}

struct AppView: View {
    @EnvironmentObject var appDelegate: AppDelegate

    var body: some View {
        if appDelegate.showDeveloperTools {
            DeveloperTools()
        } else {
            ContentView()
        }
    }
}
