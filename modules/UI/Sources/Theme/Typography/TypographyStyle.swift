//
//  TypographyStyle.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

// swiftlint:disable identifier_name
public enum TypographyStyle {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case subtitle1
    case subtitle2
    case body1
    case body2
    case button
    case caption
    case overline
}

extension TypographyStyle {
    var fontWeight: FontWeight {
        switch self {
        case .h1, .h2:
            return .light
        case .h3, .h4, .h5, .subtitle1, .body1, .body2, .caption, .overline:
            return .regular
        case .h6, .subtitle2, .button:
            return .medium
        }
    }

    var fontName: String {
        return fontWeight.fontName()
    }

    var fontSize: Double {
        switch self {
        case .h1: return 96.0
        case .h2: return 60.0
        case .h3: return 48.0
        case .h4: return 34.0
        case .h5: return 24.0
        case .h6: return 20.0
        case .subtitle1: return 16.0
        case .subtitle2: return 14.0
        case .body1: return 16.0
        case .body2: return 14.0
        case .button: return 14.0
        case .caption: return 12.0
        case .overline: return 10.0
        }
    }
}

public extension View where Self: TextStyleable {
    func typographyStyle(as style: TypographyStyle) -> some View {
        scaledFont(fontWeight: style.fontWeight, size: style.fontSize)
    }
}
