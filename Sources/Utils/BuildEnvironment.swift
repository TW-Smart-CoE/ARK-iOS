//
//  Environment.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import Core

struct BuildEnvironment {
    enum Configuration {
        case debug
        case uat
        case staging
        case release
    }

    let configuration: Configuration

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    var isDebug: Bool { self.configuration == .debug }

    var bundleIdentifier: String { Bundle.main.bundleIdentifier ?? String.empty }
}

extension BuildEnvironment {
#if DEBUG
    static let current = BuildEnvironment(configuration: .debug)
#elseif UAT
    static let current = BuildEnvironment(configuration: .uat)
#elseif STAGING
    static let current = BuildEnvironment(configuration: .staging)
#else
    static let current = BuildEnvironment(configuration: .release)
#endif
}
