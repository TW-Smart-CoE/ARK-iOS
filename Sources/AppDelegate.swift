//
//  AppDelegate.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    @Published
    var showDeveloperTools: Bool = false

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(
            name: "ARK",
            sessionRole: connectingSceneSession.role
        )
        #if DEBUG
        addDeveloperToolsShortcut(to: application)
        sceneConfiguration.delegateClass = DebugSceneDelegate.self
        #else
        sceneConfiguration.delegateClass = SceneDelegate.self
        #endif
        return sceneConfiguration
    }
}

private class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) { }

    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        completionHandler(false)
    }
}

#if DEBUG
extension AppDelegate {
    private func addDeveloperToolsShortcut(to application: UIApplication) {
        let developerToolsItem = UIApplicationShortcutItem(
            type: DevelopMenu.ShortcutType,
            localizedTitle: DevelopMenu.ShortcutName
        )
        let developerToolsItemExistsIn: ([UIApplicationShortcutItem]) -> Bool = { (shortcutItems) in
            shortcutItems.contains(where: { $0.type == developerToolsItem.type })
        }
        switch application.shortcutItems {
        case nil:
            application.shortcutItems = [developerToolsItem]
        case let shortcutItems? where !developerToolsItemExistsIn(shortcutItems):
            application.shortcutItems = shortcutItems + [developerToolsItem]
        default: break
        }
    }
}

private class DebugSceneDelegate: SceneDelegate {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    override func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        super.scene(scene, willConnectTo: session, options: connectionOptions)
        if let shortcutItem = connectionOptions.shortcutItem, shortcutItem.isDevelopMenu {
            appDelegate.showDeveloperTools = true
        }
    }

    override func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        if shortcutItem.isDevelopMenu {
            appDelegate.showDeveloperTools = true
            completionHandler(true)
        } else {
            super.windowScene(windowScene, performActionFor: shortcutItem, completionHandler: completionHandler)
        }
    }
}
#endif
