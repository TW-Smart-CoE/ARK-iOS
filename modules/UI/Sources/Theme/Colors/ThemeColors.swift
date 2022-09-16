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
            //Colors枚举相当于颜色值仓库，其他所有使用颜色值的地方都可以从这里取值。然后ThemeColors，是基于UI Guide设计的一个应用主题色集合，它可以自定义颜色值，也可以使用Colors里面定义好的色值。
            //所以，这里的statusBarColor就是使用了Colors里面定义好的blue。
            return Colors.blue.color
        default:
            return Color(self.rawValue, bundle: .uiBundle)
        }
    }
}
