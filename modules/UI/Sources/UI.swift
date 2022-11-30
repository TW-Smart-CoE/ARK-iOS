//
//  UI.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

class UIBundle {}

extension Bundle {
    static let uiBundle: Bundle = {
        let uiBundle = Bundle(for: UIBundle.self)
        guard let resourceBundleURL = uiBundle.url(
            forResource: "UI", withExtension: "bundle")
            else { fatalError("UI.bundle not found!") }
        guard let resourceBundle = Bundle(url: resourceBundleURL)
            else { fatalError("Cannot access UI.bundle!") }
        return resourceBundle
    }()
}
