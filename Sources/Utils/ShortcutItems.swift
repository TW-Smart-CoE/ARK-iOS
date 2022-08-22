//
//  ShortcutItems.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import UIKit

extension UIApplicationShortcutItem {
    var isDeveloperItem: Bool { self.type == DeveloperTools.ShortcutActionType }
}
