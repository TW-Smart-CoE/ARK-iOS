//
//  ThemeColors.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum ThemeColors: String {
    case primary
    case primaryVariant
    case secondary
    case secondaryVariant
    case background
    case surface
    case error
    case onPrimary
    case onSecondary
    case onBackground
    case onSurface
    case onError
    case statusBarColor
}

public extension ThemeColors {
    var color: Color {
        switch self {
        case .statusBarColor:
            return ColorName.blue.color
        default:
            return Color(self.rawValue, bundle: .uiBundle)
        }
    }
}
